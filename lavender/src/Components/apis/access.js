import axiosServices from "./axiosServices";
import { API_ENDPOINT } from "../../Common/constants/index";
import { refreshToken } from "../service/refreshtoken";

export const truycapAndanh = (ip) => {
  return axiosServices.post(`${API_ENDPOINT}/truycap-andanh`, { ip });
};
export const luotxemTrongthang = async (thang, nam, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/luotxem-trongthang?thang=${thang}&nam=${nam}`, {
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
      `${API_ENDPOINT}/luotxem-trongthang?thang=${thang}&nam=${nam}`,
      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};
