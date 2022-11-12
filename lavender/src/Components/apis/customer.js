import axiosServices from "./axiosServices";
import { API_ENDPOINT } from "../../Common/constants/index";
import { SMS_API_KEY } from "../../Common/constants/index";
import { SMS_ADMIN_ENDPOINT } from "../../Common/constants/index";
import { refreshToken } from "../service/refreshtoken";

export const findCustomerByBillId = async (sohoadon, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/tim-khachhang-theo-sohoadon?sohoadon=${sohoadon}`, {
      headers: { Authorization: `Bearer ${token}` },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.get(
      `${API_ENDPOINT}/tim-khachhang-theo-sohoadon?sohoadon=${sohoadon}`,
      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};
export const allCustomer = async (token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/tatca-khachhang`, {
      headers: { Authorization: `Bearer ${token}` },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.get(`${API_ENDPOINT}/tatca-khachhang`, {
      headers: { Authorization: `Bearer ${newtoken}` },
    });
  }
  return connect;
};

export const guiOTP = async (otp_generated,sdt) => {
  //remove 0 at the begin of phone number
  sdt=sdt.substring(1);

  console.log("new sdt :"+sdt);
  var connect = await axiosServices
    .post(`${SMS_ADMIN_ENDPOINT}?key=${SMS_API_KEY}&number=%2B84${sdt}&message=${otp_generated}&option=1&type=sms`);
  return connect;
};


export const thayDoiThongTin = async (data, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .put(`${API_ENDPOINT}/khachhang/thaydoi`, data, {
      headers: { Authorization: `Bearer ${token}` },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.put(`${API_ENDPOINT}/khachhang/thaydoi`, data, {
      headers: { Authorization: `Bearer ${newtoken}` },
    });
  }
  return connect;
};

export const findCustomerByCustomerId = async (makhachhang) => {
  return await axiosServices.get(
    `${API_ENDPOINT}/tim-khachhang-theo-makhachhang?makhachhang=${makhachhang}`
  );
};

export const thayDoiSDT = async (makhachhang, sdt, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .put(
      `${API_ENDPOINT}/khachhang/thaydoi/sdt`,
      { makhachhang, sdt },
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    )
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);
        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.put(
      `${API_ENDPOINT}/khachhang/thaydoi/sdt`,
      { makhachhang, sdt },
      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};

export const thayDoiEmail = async (makhachhang, email, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .put(
      `${API_ENDPOINT}/khachhang/thaydoi/email`,
      { makhachhang, email },
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    )
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.put(
      `${API_ENDPOINT}/khachhang/thaydoi/email`,
      { makhachhang, email },
      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};

export const addCustomer = async (fd, progress, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .post(`${API_ENDPOINT}/them-khachhang`, fd, {
      headers: { Authorization: `Bearer ${token}` },
      onUploadProgress: (progressEvent) => {
        progress((progressEvent.loaded / progressEvent.total) * 100);
      },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.post(`${API_ENDPOINT}/them-khachhang`, fd, {
      headers: { Authorization: `Bearer ${token}` },
      onUploadProgress: (progressEvent) => {
        progress((progressEvent.loaded / progressEvent.total) * 100);
      },
    });
  }
  return connect;
};

export const editCustomer = async (fd, progress, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .post(`${API_ENDPOINT}/sua-khachhang`, fd, {
      headers: { Authorization: `Bearer ${token}` },
      onUploadProgress: (progressEvent) => {
        progress((progressEvent.loaded / progressEvent.total) * 100);
      },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.post(`${API_ENDPOINT}/sua-khachhang`, fd, {
      headers: { Authorization: `Bearer ${token}` },
      onUploadProgress: (progressEvent) => {
        progress((progressEvent.loaded / progressEvent.total) * 100);
      },
    });
  }
  return connect;
};

export const deleteCustomer = async (makhachhang, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .delete(`${API_ENDPOINT}/xoa-khachhang?makhachhang=${makhachhang}`, {
      headers: { Authorization: `Bearer ${token}` },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.delete(
      `${API_ENDPOINT}/xoa-khachhang?makhachhang=${makhachhang}`,
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );
  }
  return connect;
};
export const hoadonDagiao = async (makhachhang, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(
      `${API_ENDPOINT}/hoadon-cuatoi-dagiao?makhachhang=${makhachhang}`,
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    )
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.get(
      `${API_ENDPOINT}/hoadon-cuatoi-dagiao?makhachhang=${makhachhang}`,
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );
  }
  return connect;
};

export const khachhangmoiTrongthang = async (
  thang,
  nam,
  token,
  refreshtoken
) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/khachhangmoi-trongthang?thang=${thang}&nam=${nam}`, {
      headers: { Authorization: `Bearer ${token}` },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);
        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.get(
      `${API_ENDPOINT}/khachhangmoi-trongthang?thang=${thang}&nam=${nam}`,
      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};
