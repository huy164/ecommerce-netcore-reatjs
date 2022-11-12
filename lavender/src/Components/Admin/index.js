import React, { useState, useEffect } from "react";
import "./style.css";
import * as hoadonAPI from "../apis/billing";
import BillItem from "./BillItem";
import ProcessingBill from "./ProcessingBill";
import Cookies from "universal-cookie";
import LoadingContainer from "../../Common/helper/loading/LoadingContainer";
import * as accessApi from "../apis/access";
import * as customerApi from "../apis/customer";
import * as detailBillApi from "../apis/detailBill";

const cookie = new Cookies();

export default function Index(props) {
  const [allBilling, setAllBilling] = useState([]);
  const [processingBilling, setProcessingBilling] = useState([]);
  const [doanhthuthangnay, setDoanhthuthangnay] = useState(0);
  const [doanhthuthangtruoc, setDoanhthuthangtruoc] = useState(0);
  const [luotxemtrongthang, setLuotxemtrongthang] = useState(0);
  const [loading, setLoading] = useState(0);
  const [khachhangmoithangnay, setKhachhangmoithangnay] = useState(0);
  const [sanphambanthangnay, setSanphambanthangnay] = useState(0);

  async function reloadFunction() {
    setLoading(true);

    var task1 = async() => {
      await hoadonAPI
        .twentyhoadon(cookie.get("token"), cookie.get("refreshtoken"))
        .then((success) => {
          setAllBilling(success.data.value.$values);
        })
        .catch((error) => {
          console.error(error);
        });
    };

    var task2 = async() => {
      var homnay = new Date();
      await hoadonAPI
        .doanhthutheothang(
          homnay.getMonth() + 1,
          homnay.getFullYear(),
          cookie.get("token"),
          cookie.get("refreshtoken")
        )
        .then((success) => {
          setDoanhthuthangnay(success.data.value);
        })
        .catch((error) => {
          console.error(error);
        });
    };

    var task3 = async() => {
      var homnay = new Date();
      await hoadonAPI
        .doanhthutheothang(
          homnay.getMonth(),
          homnay.getFullYear(),
          cookie.get("token"),
          cookie.get("refreshtoken")
        )
        .then((success) => {
          setDoanhthuthangtruoc(success.data.value);
        })
        .catch((error) => {
          console.error(error);
        });
    };

    var task4 = async() => {
      await hoadonAPI
        .processingBilling(cookie.get("token"), cookie.get("refreshtoken"))
        .then((success) => {
          setProcessingBilling(success.data.value.$values);
        })
        .catch((error) => {
          console.error(error);
        });
    };

    var task5 = async() => {
      var homnay = new Date();
      await accessApi
        .luotxemTrongthang(
          homnay.getMonth() + 1,
          homnay.getFullYear(),
          cookie.get("token"),
          cookie.get("refreshtoken")
        )
        .then((success) => {
          if (success.status === 200) setLuotxemtrongthang(success.data.value);
        })
        .catch((error) => {
          console.log(error);
        });
    };

    var task6 = async() => {
      var homnay = new Date();
      await customerApi
        .khachhangmoiTrongthang(
          homnay.getMonth() + 1,
          homnay.getFullYear(),
          cookie.get("token"),
          cookie.get("refreshtoken")
        )
        .then((success) => {
          if (success.status === 200)
            setKhachhangmoithangnay(success.data.value);
        })
        .catch((error) => {
          console.log(error);
        });
    };

    var task7 = async() => {
      var homnay = new Date();
      await detailBillApi
        .sanphamBanTrongthang(
          homnay.getMonth() + 1,
          homnay.getFullYear(),
          cookie.get("token"),
          cookie.get("refreshtoken")
        )
        .then((success) => {
          if (success.status === 200) setSanphambanthangnay(success.data.value);
        })
        .catch((error) => {
          console.log(error);
        });
    };

    await Promise.allSettled([
      task1(),
      task2(),
      task3(),
      task4(),
      task5(),
      task6(),
      task7(),
    ])
      .catch((error) => {
        console.error(error);
      });
    setLoading(false);
  }
  useEffect(() => {
    reloadFunction();
  }, []);

  return (
    <main className="main-content position-relative border-radius-lg left-menu">
      <LoadingContainer loading={loading}></LoadingContainer>
      <div className="container-fluid ">
        <div className="row">
          <div className="col-md-3">
            <div className="box h-50">
              <div className="our-services settings">
                <div className="icon">
                  {" "}
                  <img alt="" src="https://i.imgur.com/6NKPrhO.png" />{" "}
                </div>
                <div>
                  <h6>Doanh thu</h6>
                  <h4>
                    <strong>{doanhthuthangnay}</strong>
                  </h4>
                  <p>
                    {" "}
                    {(() => {
                      let result = null;
                      let suthaydoi = doanhthuthangnay - doanhthuthangtruoc;
                      if (suthaydoi > 0) result = <div>+{suthaydoi}</div>;
                      else result = <div>-{suthaydoi}</div>;
                      return result;
                    })()}
                  </p>
                  <p>
                    <i>Trong tháng</i>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div className="col-md-3">
            <div className="box h-50">
              <div className="our-services speedup">
                <div className="icon">
                  {" "}
                  <img alt="" src="https://i.imgur.com/KMbnpFF.png" />{" "}
                </div>
                <div>
                  <h6>Lượt xem</h6>
                  <h4>{luotxemtrongthang}</h4>
                  <p>+3%</p>
                  <p>
                    <i>Trong tháng</i>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div className="col-md-3">
            <div className="box h-50">
              <div className="our-services privacy">
                <div className="icon">
                  {" "}
                  <img alt="" src="https://i.imgur.com/AgyneKA.png" />{" "}
                </div>
                <div>
                  <h6>Khách mới</h6>
                  <h4>{khachhangmoithangnay}</h4>
                  <p>+2% </p>
                  <p>
                    <i>Trong tháng</i>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div className="col-md-3">
            <div className="box h-50">
              <div className="our-services backups">
                <div className="icon">
                  {" "}
                  <img alt="" src="https://i.imgur.com/vdH9LKi.png" />{" "}
                </div>
                <div>
                  <h6>Sản phẩm</h6>
                  <h4>{sanphambanthangnay}</h4>
                  <p>+5%</p>
                  <p>
                    <i>Trong tháng</i>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="row d-flex justify-content-center pb-2">
          <div className="col-md-6">
            <div className="progress">
              <div className="progress-bar">
                <div className="progress-shadow" />
              </div>
            </div>
          </div>
        </div>
        <div className="row">
          {/* <div className="col-lg-7 col-md-6 mb-md-0 mb-4">
            <div className="card">
              <div
                style={{ background: "#E93B81", color: "white" }}
                className="card-header pb-0"
              >
                <div className="row">
                  <div className="col-lg-6 col-7">
                    <h6>Hoá đơn giao dịch</h6>
                    <p className="text-sm">
                      <i className="fa fa-check text-info" aria-hidden="true" />
                      <span className="font-weight-bold ms-1">
                        {allBilling.length} hoá đơn
                      </span>{" "}
                      trong tháng
                    </p>
                  </div>
                  <div className="col-lg-6 col-5 my-auto text-end">
                    <div className="dropdown float-lg-end pe-4">
                      <a
                        href={() => false}
                        className="cursor-pointer"
                        id="dropdownTable"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                      >
                        <i className="fa fa-ellipsis-v text-secondary" />
                      </a>
                      <ul
                        className="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5"
                        aria-labelledby="dropdownTable"
                      >
                        <li>
                          <a
                            href={() => false}
                            className="dropdown-item border-radius-md"
                          >
                            Action
                          </a>
                        </li>
                        <li>
                          <a
                            href={() => false}
                            className="dropdown-item border-radius-md"
                          >
                            Another action
                          </a>
                        </li>
                        <li>
                          <a
                            href={() => false}
                            className="dropdown-item border-radius-md"
                          >
                            Something else here
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div className="card-body px-0 pb-2">
                <div className="table-responsive">
                  <table className="table align-items-center mb-0">
                    <thead>
                      <tr>
                        <th className="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                          Số điện thoại
                        </th>
                        <th className="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                          Tên khách hàng
                        </th>
                        <th className="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                          Tình trạng
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      {allBilling.map((value, key) => {
                        return <BillItem key={key} bill={value}></BillItem>;
                      })}
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div> */}
          <div className="col-8">
            <div className="card h-70" style={{ minWidth: "390px" }}>
              <div
                style={{ background: "#E93B81", color: "white" }}
                className="card-header pb-0"
              >
                <h6>Tiếp nhận đơn hàng</h6>
                <p className="text-sm">
                  <i
                    className="fa fa-arrow-up text-success"
                    aria-hidden="true"
                  />
                  <span className="font-weight-bold">
                    {processingBilling.length}
                  </span>{" "}
                  đơn hàng
                </p>
              </div>
              <div className="card-body p-3">
                <div className="timeline timeline-one-side">
                  {processingBilling.map((value, key) => {
                    return (
                      <ProcessingBill
                        bill={value}
                        key={key}
                        reloadFunction={reloadFunction}
                      ></ProcessingBill>
                    );
                  })}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  );
}
