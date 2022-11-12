import React, { useState, useEffect } from "react";
import * as billingApi from "../../apis/billing";
import { useSelector } from "react-redux";
import Cookies from "universal-cookie";
import ItemDanggiao from "./ItemDanggiao";
import _ from "lodash";

const cookie = new Cookies();

export default function Danggiao() {
  const [list, setList] = useState([]);

  const makhachhang = useSelector((state) => state.login.makhachhang);

  const deleteFunction = (sohoadon) => {
    var listtemp = list;

    _.remove(listtemp, (n) => {
      return n.sohoadon === sohoadon;
    });
    setList([...listtemp]);
  };
  useEffect(() => {
    const token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    billingApi
      .hoadonCuatoiDanggiao(makhachhang, token, refreshtoken)
      .then((success) => {
        if (success.status === 200) setList(success.data.value.$values);
      })
      .catch((error) => {
        console.error(error);
      });
  }, [makhachhang]);
  return (
    <div class="Account__StyledAccountLayoutInner-sc-1d5h8iz-1 jXurFV">
      <div class="styles__StyledAccountListOrder-sc-6t66uv-0 iOhDoD">
        <div class="inner">
          {list.map((value, key) => {
            return (
              <ItemDanggiao
                bill={value}
                key={key}
                deleteFunction={deleteFunction}
              ></ItemDanggiao>
            );
          })}
        </div>
      </div>
    </div>
  );
}
