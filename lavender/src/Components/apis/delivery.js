import axiosServices from "./axiosServices";
import { X_RAPID_API_KEY_GEOCODING } from "../../Common/constants/index";
import { DISTANCE_MATRIX_API_KEY } from "../../Common/constants/index";
import { API_ENDPOINT } from "../../Common/constants/index";


export const GeoCoding = async (city) => {
  var connect = await axiosServices
    .get(`https://forward-reverse-geocoding.p.rapidapi.com/v1/search?q=${city}`, {
      headers: { 'x-rapidapi-key': `${X_RAPID_API_KEY_GEOCODING}` }
    })
    .catch((error) => {
      console.log(error);
    });
  return connect;
};
export const calDistance = async (origin, destination) => {
  var connect = await axiosServices
    .get(`https://api.distancematrix.ai/maps/api/distancematrix/json?origins=${origin}&destinations=${destination}&key=${DISTANCE_MATRIX_API_KEY}`)
    .catch((error) => {
      console.log(error);
    });
  return connect;
};

export const calCost = async (distance) => {
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/tinh-phivanchuyen?khoangcach=${distance}`)
    .catch((error) => {
      console.log(error);
    });
  return connect;
};

export const allDeliveryCost = async () => {
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/tatca-phivanchuyen`)
    .catch((error) => {
      console.log("error call api"+error);
    });
  return connect;
};

export const addCostItem = async (khoangcachmin, khoangcachmax, chiphi) => {
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/them-phivanchuyen?khoangcachmin=${khoangcachmin}&khoangcachmax=${khoangcachmax}&chiphi=${chiphi}`)
    .catch((error) => {
      console.log(error);
    });
  return connect;
};

export const editCostItem = async (maphivanchuyen, khoangcachmin, khoangcachmax, chiphi) => {
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/sua-phivanchuyen?maphivanchuyen=${maphivanchuyen}&khoangcachmin=${khoangcachmin}&khoangcachmax=${khoangcachmax}&chiphi=${chiphi}`)
    .catch((error) => {
      console.log(error);
    });
  return connect;
};

export const deleteCostItem = async (maphivanchuyen) => {
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/xoa-phivanchuyen?maphivanchuyen=${maphivanchuyen}`)
    .catch((error) => {
      console.log(error);
    });
  return connect;
};


