import { toast } from "react-toastify";

import "react-toastify/dist/ReactToastify.css";
export const toastError = (message,delay) => {
  if(delay === undefined){delay =2000}
  toast.error(message, {
    position: "top-right",
    autoClose: delay,
    hideProgressBar: false,
    closeOnClick: true,
    pauseOnHover: true,
    draggable: true,
    progress: undefined,
  });
};

export const toastSucces = (message,delay) => {
  if(delay === undefined){delay =2000}
  toast.success(message, {
    position: "top-right",
    autoClose: delay,
    hideProgressBar: false,
    closeOnClick: true,
    pauseOnHover: true,
    draggable: true,
    progress: undefined,
  });
};

export const toastLoading = (message, delaytime) => {
  var mess = "Vui lòng đợi ...";
  if (message !== undefined) mess = message;

  const id = toast.loading(mess);

  var delayInMilliseconds = 4000;
  if (delaytime !== undefined) delayInMilliseconds = delaytime;

  setTimeout(function () {
    toast.dismiss(id);
  }, delayInMilliseconds);
  return id;
};
