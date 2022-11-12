import axiosServices from "./axiosServices";
import { API_ENDPOINT } from "../../Common/constants/index";
import { refreshToken } from "../service/refreshtoken";

export const twentyhoadon = async (token, refreshtoken) => {
  const url = "/twenty-hoadon";
  var newtoken = undefined;
  var connect = await axiosServices
    .get(API_ENDPOINT + url, {
      headers: { Authorization: `Bearer ${token}` },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.get(API_ENDPOINT + url, {
      headers: { Authorization: `Bearer ${newtoken}` },
    });
  }
  return connect;
};
export const processingBilling = async (token, refreshtoken) => {
  const url = "/hoa-don-dang-xu-ly";
  var newtoken = undefined;
  var connect = await axiosServices
    .get(API_ENDPOINT + url, {
      headers: { Authorization: `Bearer ${token}` },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.get(API_ENDPOINT + url, {
      headers: { Authorization: `Bearer ${newtoken}` },
    });
  }
  return connect;
};
export const doanhthutheothang = async (thang, nam, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/doanh-thu-theo-thang?thang=${thang}&nam=${nam}`, {
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
      `${API_ENDPOINT}/doanh-thu-theo-thang?thang=${thang}&nam=${nam}`,
      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};
export const addOrUpdateBilling = async (data, token, refreshtoken) => {
  const url = "/them-sua-hoa-don";
  var newtoken = undefined;
  var connect = await axiosServices
    .post(API_ENDPOINT + url, data, {
      headers: { Authorization: `Bearer ${token}` },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.post(API_ENDPOINT + url, data, {
      headers: { Authorization: `Bearer ${newtoken}` },
    });
  }
  return connect;
};
export const deleteBill = async (sohoadon, token, refreshtoken) => {
  const url = "/xoa-hoadon?sohoadon=";
  var newtoken = undefined;
  var connect = await axiosServices
    .delete(API_ENDPOINT + url + sohoadon, {
      headers: { Authorization: `Bearer ${token}` },
    })
    .catch((error) => {
      if (error.response.status === 401) {
        newtoken = refreshToken(refreshtoken);

        return error;
      }
    });
  if (newtoken !== undefined) {
    return await axiosServices.delete(API_ENDPOINT + url + sohoadon, {
      headers: { Authorization: `Bearer ${newtoken}` },
    });
  }
  return connect;
};

export const muaHang = async (
  makhachhang,
  makhuyenmai,
  phivanchuyen,
  tongtien,
  danhsachsanpham,
  token,
  refreshtoken
) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .post(
      `${API_ENDPOINT}/muahang?makhachhang=${makhachhang}&makhuyenmai=${makhuyenmai}&phivanchuyen=${phivanchuyen}&tongtien=${tongtien}`,
      danhsachsanpham,
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
    return await axiosServices.post(
      `${API_ENDPOINT}/muahang?makhachhang=${makhachhang}&makhuyenmai=${makhuyenmai}&tongtien=${tongtien}`,
      danhsachsanpham,
      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};

export const tracuuNgaymua = (sohoadon) => {
  return axiosServices.get(
    `${API_ENDPOINT}/tracuu-ngaymua-theosohoadon?sohoadon=${sohoadon}`
  );
};

export const hoadonCuatoiDangxuly = async (
  makhachhang,
  token,
  refreshtoken
) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/hoadon-cuatoi-dangxuly?makhachhang=${makhachhang}`, {
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
      `${API_ENDPOINT}/hoadon-cuatoi-dangxuly?makhachhang=${makhachhang}`,

      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};

export const hoadonCuatoiDanggiao = async (
  makhachhang,
  token,
  refreshtoken
) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/hoadon-cuatoi-danggiao?makhachhang=${makhachhang}`, {
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
      `${API_ENDPOINT}/hoadon-cuatoi-danggiao?makhachhang=${makhachhang}`,

      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};

export const tuchoiDonhang = async (sohoadon, token, refreshtoken) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/tuchoi-donhang?sohoadon=${sohoadon}`, {
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
      `${API_ENDPOINT}/tuchoi-donhang?sohoadon=${sohoadon}`,

      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};

export const tiepnhanDonhang = async (
  sohoadon,
  manhanvien,
  token,
  refreshtoken
) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(
      `${API_ENDPOINT}/tiepnhan-donhang?sohoadon=${sohoadon}&manhanvien=${manhanvien}`,
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
      `${API_ENDPOINT}/tiepnhan-donhang?sohoadon=${sohoadon}&manhanvien=${manhanvien}`,

      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};


export const hoadonCuatoiDahuy = async (
  makhachhang,
  token,
  refreshtoken
) => {
  var newtoken = undefined;
  var connect = await axiosServices
    .get(`${API_ENDPOINT}/hoadon-cuatoi-dahuy?makhachhang=${makhachhang}`, {
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
      `${API_ENDPOINT}/hoadon-cuatoi-dahuy?makhachhang=${makhachhang}`,

      { headers: { Authorization: `Bearer ${newtoken}` } }
    );
  }
  return connect;
};
