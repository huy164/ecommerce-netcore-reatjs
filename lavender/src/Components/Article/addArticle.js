import { EditorState, convertToRaw } from 'draft-js';
import { Editor } from 'react-draft-wysiwyg';
import draftToHtml from 'draftjs-to-html';
import "./style.css";
import React, { Component } from "react";
import "reactjs-popup/dist/index.css";
import * as articleApi from "../apis/article";
import * as myToast from "../../Common/helper/toastHelper";
import "./style.css";



export default class AddArticle extends Component {

  
    constructor(props) {
        super(props)
        this.state = {
            editorState: EditorState.createEmpty(),
            tieude: '',
            mota: '',
            noidung: '',
            thumnail: '',
            disable: false,
            status: 'đăng bài viết'
        }
    }

    onEditorStateChange = (editorState) => {
        this.setState({
            editorState,
        });
    };

    changeHandler = e => {
        this.setState({ [e.target.name]: e.target.value })
    }
    submitHandler = e => {
        e.preventDefault();
        if (this.state.editorState != undefined) {
            this.state.noidung = draftToHtml(convertToRaw(this.state.editorState.getCurrentContent()))
        }
        this.state.editorState = undefined;//remove state property
        console.log(JSON.stringify(this.state))
        const fd = new FormData();
        fd.append("tieude", this.state.tieude);
        fd.append("mota", this.state.mota);
        fd.append("noidung", this.state.noidung);
        fd.append("thumnail", this.state.thumnail);
        articleApi
            .addArticle(fd)
            .then((success) => {
                myToast.toastSucces("Đã gửi bài viết , chờ phê duyệt");
                this.setState({
                    disable: true,
                    status:'đang xét duyệt'
                });
            })
            .catch((error) => {
                myToast.toastError("Thêm mới thất bại");
                console.error(error);
            });

    }

    render() {
        const { editorState,tieude, mota, thumnail, disable ,status} = this.state;
        return (
            <div className="addArticle">
                <div className="mt-7">
                    <h3>Tạo bài viết</h3>
                    <form onSubmit={this.submitHandler}>
                        <div className="form-group pt-3">
                            <h5>Tiêu đề</h5>
                            <input name='tieude' value={tieude} onChange={this.changeHandler} type="text" className="form-control border" placeholder="nhập tiêu đề bài viết" />
                            <h5>Mô tả</h5>
                            <textarea name='mota' value={mota} onChange={this.changeHandler} className="form-control border" id="" rows="3" placeholder="nhập mô tả bài viết"></textarea>
                            <h5>Thumnail</h5>
                            <input name='thumnail' value={thumnail} onChange={this.changeHandler} type="text" className="form-control border" placeholder="nhập url thumnail" />
                        </div>
                        <Editor value={editorState}
                            wrapperClassName="demo-wrapper"
                            editorClassName="demo-editor"
                            onEditorStateChange={this.onEditorStateChange}
                        />
                        <input type="submit" disabled={disable} value={status} className="btn btn-success"/>
                    </form>
                </div>
            </div>
        );
    }
}

