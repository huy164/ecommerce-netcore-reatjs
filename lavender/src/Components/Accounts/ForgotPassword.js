import { useState } from 'react';
import * as myConst from "../../Common/constants/index";
import * as myToast from "../../Common/helper/toastHelper";
import * as loginApi from "../apis/login"
import axios from "axios";
function ForgotPassword() {
    const [input, setInput] = useState("");
    function saveUser() {
        if (input.toString() === "") {
            myToast.toastError("Email hoặc tên tài khoản không được bỏ trống");
            return;
        }
        else {
            myToast.toastLoading("đang xử lý",3000)
            loginApi.ForgotPassword(input).then(function (res) {
                let email=res.data.slice(0,5)+"*******"+res.data.slice(res.data.length-9,res.data.length);
                let message="đã gửi mail đến "+email;
                myToast.toastSucces(message,5000);
            }).catch(function (err){
                console.log("error on get password"+err);
                myToast.toastError('email hoặc tên đăng nhập không tồn tại')
            })
        }
    }
    return (
        <div className="row d-flex justify-content-center">
            <div className="col-4">
                <form>
                    <div className="form-group ">
                        <h3>Quên mật khẩu</h3>
                        <input type="text"
                            value={input} name="input"
                            onChange={(e) => { setInput(e.target.value) }}
                            className="form-control border mb-3" placeholder="Nhập Email hoặc tên đăng nhập" />
                    </div>
                    <button type="button" onClick={saveUser} className="btn btn-primary">Lấy Mật Khẩu</button>
                </form>
            </div>
        </div>
    )
}
export default ForgotPassword;