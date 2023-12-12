import React from 'react';

const NotificationItem = ({ message, time, read }) => {
    return (
        <div className={` m-2 flex items-center justify-center rounded-xl w-[90%] transition duration-300 ${!read && 'hover:bg-blue-50'} `}>
            <div className={`p-1 m-2 flex-col items-start text-start`}>
                <p className={`${!read && 'font-bold'} font-ProductSansMedium`} style={{ color: '#001524' }}>{message}</p>
                <p className="text-sm text-gray-500 font-ProductSans">{time}</p>
            </div>
        </div>
    );
};

export default NotificationItem;
