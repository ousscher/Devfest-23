const admin = require("firebase-admin");

const serviceAccount = require("./path-to-firebase-service-account.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});
async function sendPushNotification(fcmToken, title, body) {
  const message = {
    token: fcmToken,
    notification: {
      title: title,
      body: body,
    },
    data: {
    },
  };

  try {
    const response = await admin.messaging().send(message);
    console.log("Successfully sent message:", response);
  } catch (error) {
    console.error("Error sending message:", error);
  }
}
