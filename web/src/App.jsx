import axios from "axios";
import FileUploader from "./comp/FileUploader";

function App() {
    const sendImage = async (e, file, description) => {
        e.preventDefault();

        const formData = new FormData();
        formData.append("image", file);
        formData.append("description", description);

        const result = await axios.post(
            "http://localhost:4000/api/images",
            formData,
            {
                headers: { "Content-Type": "multipart/form-data" },
            }
        );
        console.log(result.data);
    };
    return (
        <>
            <FileUploader submit={sendImage} />
        </>
    );
}

export default App;