import { useState, useEffect } from "react";
import logo from "../assets/react.svg";
import { FaSignOutAlt, FaBars, FaTimes } from "react-icons/fa";
import { IoIosNotificationsOutline } from "react-icons/io";
import { Outlet, Link, useLocation } from "react-router-dom";
import NotificationPopOut from "../comp/NotificationPopOut";
import Cookies from "js-cookie";
function Layout() {
  const [bol, setBol] = useState(false);
  const [notifVisible, setNotifVisible] = useState(false);
  const logOutHandler = async () => {
    Cookies.remove("authToken");

    console.log("yes");
    window.location.href = "/";
  };

  const showNotif = () => {
    setNotifVisible(!notifVisible);
  };

  useEffect(() => {
    setNotifVisible(false); // Hide the notification
    setBol(false);
  }, []);
  return (
    <>
      {notifVisible && <NotificationPopOut />}
      <div
        className={` h-screen  w-screen sm:w-1/3 md:w-1/4 xl:w-[250px] ${
          !bol && "hidden "
        } sm:flex flex-col text-black duration-1000 ease-in-out	 `}
      >
        <div className=" side-bar h-full w-full flex flex-col shadow-lg  items-center">
          {!bol ? <img src={logo} className=" image1 w-1/3 py-6" /> : ""}
          <div className=" text-[blue] flex flex-col h-1/2 sm:h-1/3  justify-between mt-28 sm:mt-7">
            <Link to="/Dashboard">Dashboard</Link>
            <Link to="/Members_list">Members list</Link>
            <Link to="/Projects_list">Projects List</Link>
            <Link to="/My_account">My account</Link>
          </div>
          <div className="  fixed bottom-0 p-4 w-full xl:w-1/6 sm:w-1/6 border-t justify-center flex items-center border-t-black ">
            <FaSignOutAlt
              size="25px"
              color="red"
              className="scale-x-[-1] pl-2"
            />
            <p
              onClick={() => {
                logOutHandler();
              }}
              className="cursor-pointer"
            >
              Log out
            </p>
          </div>
        </div>
      </div>
      <div className=" bg-[red]  	z-100 w-full  fixed h-fit flex sm:justify-end justify-between px-4 pt-5 items-center ">
        {!bol ? (
          <FaBars
            className=" top-6 left-5 sm:hidden flex"
            size="24px"
            color="#2B82FB"
            onClick={() => setBol(true)}
          />
        ) : (
          <FaTimes
            size="24px"
            color="blue"
            className="sm:hidden absolut flex top-6 left-5"
            onClick={() => setBol(false)}
          />
        )}
        {!bol ? (
          <div className="navbar-5 relati  z-50 flex items-center ">
            <IoIosNotificationsOutline
              size="24"
              color="blue"
              className="cursor-pointer "
              onClick={showNotif}
            />

            <Link to="/my_account" className="p-0">
              <img
                className="w-7 h-[27px] rounded-[50%] mx-3 cursor-pointer"
                src={logo}
                width="20px"
                height="20px"
              />
            </Link>
          </div>
        ) : (
          <img className=" w-15 h-7" src={logo} />
        )}
      </div>
    </>
  );
}

export default Layout;
