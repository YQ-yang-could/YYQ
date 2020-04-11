<?php
/**
 * Created by PhpStorm.
 * User: sbpig
 * Date: 2019/10/20
 * Time: 20:05
 */
namespace app\admin\controller;


use think\Db;
use think\Session;

class Index extends  \think\Controller{
    public function index(){
        if(Session::has('admin')) {
            return $this->fetch('index');
        }else{
            return $this->fetch('adminLogin');
        }
    }
    public function adminLogin(){
        return $this->fetch('adminLogin');
    }
    public function login(){
        if (request()->post()) {
            $u_username = request()->post('admin');
            $u_password = request()->post('pwd');
            if (empty($u_password) || empty($u_password)) {
                $this->error("用户名或密码不能为空");
            }
            $user_info = Db::name('admin')->where('admin', $u_username)->find();
            if (empty($user_info)) {
                $this->error("用户不存在，请重新登录");
            } else {
                if (md5($u_password) != $user_info['pwd']) {
                    $this->error("密码不正确，请重新登录");
                } else {
                    Session::set('admin', $u_username,'think');
                    $this->success("登录成功！", url('index/index'));
                }
            }
        }
    }
    public function product_list(){
        $data=Db::name('course')->select();
        $this->assign('course',$data);
        return $this->fetch('product_list');
    }
    public function product_category(){
        $data=Db::name('user')->select();
        $this->assign('user',$data);
        return $this->fetch('product_category');
    }
    public function recycle_bin(){
        return $this->fetch('recycle_bin');
    }
    public function top(){
        $this->assign('admin',Session::get('admin'));
        return $this->fetch('top');
    }
    public function menu(){
        return $this->fetch('menu');
    }
    public function bar(){
        return $this->fetch('bar');
    }
    public function main(){
        return $this->fetch('main');
    }
	public function edit_product(){
	    return $this->fetch('edit_product');
	}
	public function add_category(){
	    return $this->fetch('add_category');
	}
    // 文件上传提交
    public function up()
    {
        if(request()->isPost()){
            $course=request()->post();
            var_dump($course);
            $video=request()->file('video');
            $img=request()->file('img');
            if(empty($course['course_name'])&&$course['type']){
                $this->error('课程名称、课程分类和课程方向为必填项');
            }
            if(empty($img)){
                $this->error('请选择上传图片');
            }
            if(empty($video)){
                $this->error('请选择上传视频');
            }
            $imginfo=$img->move(ROOT_PATH . 'public/static/course' . DS . 'imgs');
            $videoinfo=$video->move(ROOT_PATH . 'public/static/course' . DS . 'video');
            if($imginfo){
                if($videoinfo){
                    $course['video']=$videoinfo->getSaveName();
                    $course['img']=$imginfo->getSaveName();
                    Db::name('course')->insert($course);
                    $this->success('添加成功',url('index/product_list'));
                }else{
                    $this->error($video->getError());
                }
                $this->error($img->getError());
            }
        }
        // 获取表单上传文件
        $file = request()->file('file');
        if (empty($file)) {
            $this->error('请选择上传文件');
        }
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->move(ROOT_PATH . 'public/static' . DS . 'imgs');
        if ($info) {
            $ppath['picture']=$info->getSaveName();
            Db::name('user')->where('username',Session::get('username'))->update($ppath);
            Session::set('head_picture',$ppath);
        } else {
            // 上传失败获取错误信息
            $this->error($file->getError());
        }
    }
}
