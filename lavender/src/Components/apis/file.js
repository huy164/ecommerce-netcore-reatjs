import axiosServices from "./axiosServices";
import { API_ENDPOINT } from "../../Common/constants/index";
import { refreshToken } from "../service/refreshtoken";

export const xuatHoadon = async (tungay, denngay, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/xuat-hoadon?tungay=${tungay}&denngay=${denngay}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
      responseType: "blob",
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);
        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.get(
      `${API_ENDPOINT}/xuat-hoadon?tungay=${tungay}&denngay=${denngay}`,
      { headers: { Authorization: `Bearer ${newtoken}` }, responseType: "blob" }
    );
  }
  return connect;
};

export const xuatPhieunhap = async (tungay, denngay, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/xuat-phieunhap?tungay=${tungay}&denngay=${denngay}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
      responseType: "blob",
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);
        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.get(
      `${API_ENDPOINT}/xuat-phieunhap?tungay=${tungay}&denngay=${denngay}`,
      { headers: { Authorization: `Bearer ${newtoken}` }, responseType: "blob" }
    );
  }
  return connect;
};