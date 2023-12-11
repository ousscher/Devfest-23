import React, { useState } from 'react';
import NotificationItem from './NotificationItem';

const NotificationPopOut = () => {

    // in the parent component: 
    // const [notificationPopOutOpened, setOpenNotificationPopout] = useState(false);

    // const openNotifPopout = () => {
    //     { !notificationPopOutOpened ? setOpenNotificationPopout(true) : setOpenNotificationPopout(false) }
    // }

    // <div className="w-4/5 items-end justify-end">
    //     <button
    //       className="rounded-5 bg-gray-500"
    //       onClick={openNotifPopout}>
    //       notifications button
    //     </button>
    //     {notificationPopOutOpened && <NotificationPopOut />}
    //   </div>

    // static notifications for testing 
    const [notifications, setNotifications] = useState([
        { message: 'Notification 1 texte texte texte ', time: '2 minutes ago', read: false },
        { message: 'Notification 2 texte texte texte', time: '1 hour ago', read: true },
        { message: 'Notification 1 texte texte texte ', time: '2 minutes ago', read: false },
        { message: 'Notification 1 texte texte texte ', time: '2 minutes ago', read: false },
        { message: 'Notification 1 texte texte texte ', time: '2 minutes ago', read: false },
        { message: 'Notification 1 texte texte texte ', time: '2 minutes ago', read: false },

    ]);

    const markAllAsRead = () => {
        const updatedNotifications = notifications.map(notification => ({
            ...notification,
            read: true,
        }));
        setNotifications(updatedNotifications);
    };

    const renderNotifications = () => {
        if (notifications.length <= 5) {
            // If there are 5 or fewer notifications, render them all.
            return (
                <div className="flex flex-col space-y-4 ">
                    {notifications.map((notification, index) => (
                        <NotificationItem
                            key={index}
                            message={notification.message}
                            time={notification.time}
                            read={notification.read}
                        />
                    ))}
                </div>
            );
        } else {
            // If there are more than 5 notifications, render a scrollable container.
            return (
                <div className='flex flex-col space-y-4 ' 
                    style={{
                        maxHeight: '400px',
                        overflowY: 'scroll',
                    }}>
                    {notifications.map((notification, index) => (
                        <NotificationItem
                            key={index}
                            message={notification.message}
                            time={notification.time}
                            read={notification.read}
                        />
                    ))}
                </div>
            );
        }
    };

    return (
        //reglage du top et right apres l'integration avec le composant parent
        <div className='bg-white z-50 p-4 rounded-lg max-w-sm shadow-md fixed top-12 right-3'>
            <div className='flex flex-row p-2 mb-4'>
                <h1 className="text-[16px] font-semibold md:mr-20 mr-10 mt-3">Notifications</h1>
                <button
                    onClick={markAllAsRead}
                    className="text-blue-500 bg-transparent border-none"
                >
                    Mark All as Read
                </button>
            </div>

            {/* Display notifications */}
            {renderNotifications()}
        </div>
    );
};

export default NotificationPopOut;
