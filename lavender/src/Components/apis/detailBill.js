import axiosServices from "./axiosServices";
import { API_ENDPOINT } from "../../Common/constants/index";
import { refreshToken } from "../service/refreshtoken";

export const detailByBillId = async (sohoadon, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/chitietthoadon-theo-sohoadon?sohoadon=${sohoadon}`,
      {
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
      `${API_ENDPOINT}/chitietthoadon-theo-sohoadon?sohoadon=${sohoadon}`,
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );
  }
  return connect;
};
export const guiMailHoaDon = async (sohoadon, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/chitietthoadon-guiMail?sohoadon=${sohoadon}`,
      {
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
      `${API_ENDPOINT}/chitietthoadon-theo-sohoadon?sohoadon=${sohoadon}`,
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );
  }
  return connect;
};


  export const detailBillByImei = (imei) => {
    return axiosServices.get(`${API_ENDPOINT}/tracuu-sohoadon?imei=${imei}`);
  };

  export const sanphamBanTrongthang = async (thang, nam, token, refreshtoken) => {
    var newtoken = undefined;
    var connect = await axiosServices
      .get(`${API_ENDPOINT}/sanpham-ban-trongthang?thang=${thang}&nam=${nam}`,
        {
          headers: { Authorization: `Bearer ${token}` },
        })
      .catch((error) => {
        if (error.response.status === 401) {
          newtoken = refreshToken(refreshtoken);
          return error;
        }
      });
    if (newtoken !== undefined) {
      return await axiosServices
        .get(`${API_ENDPOINT}/sanpham-ban-trongthang?thang=${thang}&nam=${nam}`,
          {
            headers: { Authorization: `Bearer ${token}` },
          }
        );
    }
    return connect;
  };

