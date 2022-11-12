import React, { useEffect, useState } from "react";
import * as detailBillApi from "../../apis/detailBill";
import ItemDagiao from "./ItemDagiao";
import { numberWithCommas } from '../../../Common/helper/numberHelper';


export default function Hoadon(props) {
  const [list, setList] = useState([]);
  useEffect(() => {
    detailBillApi.detailByBillId(props.bill.sohoadon)
      .then((success) => {
        if (success.status === 200) {
          setList(success.data.value.$values);
        }
      })
      .catch((error) => {
        console.error(error);
      })
  }, [props.bill.sohoadon])
  return (
    <div className="border rounded">
      <div>
        <div className="GuWdvd">
          <div className="WqnWb-">
            <div className="_1DPpu5">
              {list.map((value, key) => {
                return (<ItemDagiao product={value} key={key} makhachhang={props.makhachhang}></ItemDagiao>);
              })}
            </div>
          </div>
        </div>
      </div>
      <div>
        <hr></hr>
        <tr>
          <td> Số HD: {props.bill.sohoadon}</td>
          <td>Ngày HD: {props.bill.ngayhoadon}</td>
          <td>Mã KM: {props.bill.makhuyenmai}</td>
          <td> <strong>Thành tiền: {numberWithCommas(props.bill.tongtien)} đ</strong> </td>
        </tr>
      </div>
    </div>

  );
}
