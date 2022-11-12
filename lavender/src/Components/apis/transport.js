import axiosServices from "./axiosServices";
import { API_ENDPOINT } from "../../Common/constants/index";

export const vanchuyenBangSohoadon = (sohoadon) => {
  return axiosServices.get(`${API_ENDPOINT}/vanchuyen-bang-sohoadon?sohoadon=${sohoadon}`);
};
