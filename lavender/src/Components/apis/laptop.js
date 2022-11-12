import axiosServices from "./axiosServices";
import {API_ENDPOINT} from "../../Common/constants/index";


   
export const laptop=()=>{
    const url="/laptop";
    return axiosServices.get(API_ENDPOINT+url);
};
export const laptopWithNewPrice=()=>{
    const url="/laptop-with-new-price";
    return axiosServices.get(API_ENDPOINT+url);
};
export const laptopInfo=(query)=>{
    return axiosServices.get(API_ENDPOINT+query);
};