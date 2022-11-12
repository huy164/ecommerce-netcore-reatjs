import axiosServices from "./axiosServices";
import {API_ENDPOINT} from "../../Common/constants/index";

   
/* lấy tất cả dữ liệu là mobile*/
export const mobile=()=>{
    var url = `/mobile`

    return axiosServices.get(API_ENDPOINT+  url);
};
export const mobileWithNewPrice=()=>{
    var url = `/mobile-with-new-price`

    return axiosServices.get(API_ENDPOINT+  url);
};
export const mobileInfo=(query)=>{

    return axiosServices.get(API_ENDPOINT+query);
};