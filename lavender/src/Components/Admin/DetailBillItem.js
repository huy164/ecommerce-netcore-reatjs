import React, { useState, useEffect } from "react";
import * as productApi from "../apis/product";
import * as detailProductApi from "../apis/detailProduct";

export default function DetailBillItem(props) {
  const [chitietsanpham, setChitietsanpham] = useState();
  const [sanpham, setSanpham] = useState();
  useEffect(() => {
    (async () => {
      var a = undefined;
      await detailProductApi
        .timkiemChitietsanphamImei(props.detail.imei)
        .then((success) => {
          if (success.status === 200) {
            setChitietsanpham(success.data.value);
            a = success.data.value;
          }
        })
        .catch((error) => {
          console.log(error);
        });
      productApi
        .findProductById(a.masanpham)
        .then((success) => {
          if (success.status === 200) {
            setSanpham(success.data.value);
          }
        })
        .catch((error) => {
          console.error(error);
        });
    })();
  }, [props.detail]);
  return (
    <div>
      {props.detail !== undefined &&
        chitietsanpham !== undefined &&
        sanpham !== undefined && (
          <div className="row mt-2 border rounded">
            <div className="col-md-6">
              <label className="labels">Imei:</label>
              <span className="mx-3">{props.detail.imei}</span>
            </div>

            <div className="col-md-6">
              <label className="labels">Đơn giá: </label>
              <span className="mx-3">{props.detail.tien}</span>
            </div>

            <div className="col-md-6">
              <label className="labels">Mã sản phẩm:</label>
              <span className="mx-3">{sanpham.masanpham}</span>
            </div>

            <div className="col-md-6">
              <label className="labels">Tên sản phẩm: </label>
              <span className="mx-3">{sanpham.tensanpham}</span>
            </div>

            <div className="col-md-6">
              <label className="labels">Màu sắc:</label>
              <span className="mx-3">{chitietsanpham.mausac}</span>
            </div>

            <div className="col-md-6">
              <label className="labels">Dung lượng: </label>
              <span className="mx-3">{chitietsanpham.dungluong}</span>
            </div>
          </div>
        )}
    </div>
  );
}
