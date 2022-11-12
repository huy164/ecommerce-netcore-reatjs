import React, { useEffect, useState } from "react";
import * as imageApi from "../../apis/image";
import * as productApi from "../../apis/product";
import { numberWithCommas } from '../../../Common/helper/numberHelper';


export default function Chitietsanpham(props) {
  const [item, setItem] = useState();
  useEffect(() => {
    productApi.findProductByImei(props.product.imei).then(success => {
      if (success.status === 200) {
        setItem(success.data.value);
      }
    })
      .catch(error => {
        console.log(error);
      })
  }, [props.product]);

  return (
    <>
      {item !== undefined && (
        <div className="_2lVoQ1">
          <div className="_1limL3">
            <div>
              <span className="_1BJEKe">
                <div />
                <div className="_3huAcN">
                  <div className="_3btL3m">
                    <div className="shopee-image__wrapper">
                      <img
                        alt="anhthunho"
                        className="shopee-image__content"
                        src={imageApi.image(item.image)}
                      ></img>
                    </div>
                  </div>
                  <div className="_1cxKtp">
                    <div>
                      <div className="_1xHDVY">
                        <span className="_30COVM text-info">
                          {item.tensanpham}
                        </span>
                      </div>
                      <div className="_1xHDVY">
                        <span className="_30COVM  small">
                          imei: {item.imei}
                        </span>
                      </div>
                      <div className="_1kvNGb text-secondary">
                        <div>
                          <span className="">{item.mausac} - {item.dungluong}</span>
                        </div>
                      </div>
                      <div className="_1kvNGb text-warning">
                        <div>
                          Đơn giá:{" "}
                          <span >{numberWithCommas(item.giamoi)}₫</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </span>
            </div>
            <div className="_3tEHtP" />
          </div>
        </div>
      )}
    </>
  );
}
