<?php
namespace app\index\controller;

use think\Session;
use think\Db;

class Index extends \think\Controller
{
    public function index()
    {
        if(Session::has('username')){
            return $this->fetch('home');
        }else{
            $data=Db::name('course')->select();
            $result=Db::name('teacher')->select();
            $this->assign('course',$data);
            $this->assign('teacher',$result);
            return  $this->fetch();
        }
    }
    public function home(){
        if(!Session::has('username')){
            return $this->error("请登录", url('index/index/slogin'));
        }
        $data=Db::name('course')->select();
        $result=Db::name('teacher')->select();
        $this->assign('course',$data);
        $this->assign('username',Session::get('username'));
        $this->assign('head_picture',Session::get('head_picture'));
        $this->assign('teacher',$result);
        return $this -> fetch('home');
    }
    public function course(){
        if(!Session::has('username')){
            return $this->error("请登录", url('index/index/slogin'));
        }
        $data=Db::name('course')->field('img,video')->select();
        $this->assign('head_picture',Session::get('head_picture'));
        $this->assign('username',Session::get('username'));
        $this->assign('course',$data);
        return $this -> fetch('course');
    }
    public function scourse($type){
        if(!Session::has('username')){
            return $this->error("请登录", url('index/index/slogin'));
        }
        $data=Db::name('course')->where('type',$type)->field('img,video')->select();
        $this->assign('head_picture',Session::get('head_picture'));
        $this->assign('username',Session::get('username'));
        $this->assign('course',$data);
        return $this->fetch('course');
    }
    public function selectCourse($direction){
        if(!Session::has('username')){
            return $this->error("请登录", url('index/index/slogin'));
        }
        $this->assign('head_picture',Session::get('head_picture'));
        $this->assign('username',Session::get('username'));
        $data=Db::name('course')->where('direction',$direction)->select();
        $this->assign('course',$data);
        return $this -> fetch('course');
    }
    public function searchCourse(){
        if(!Session::has('username')){
            return $this->error("请登录", url('index/index/slogin'));
        }
        $search=request()->post('search');
        $this->assign('head_picture',Session::get('head_picture'));
        $this->assign('username',Session::get('username'));
        $data=Db::name('course')->where('type','like',"%".strtolower($search)."%")->select();
        $this->assign('course',$data);
        return $this -> fetch('course');
    }
    public function detail($v){
        if(!Session::has('username')){
            return $this->error("请登录", url('index/index/slogin'));
        }
        $this->assign('video',$v);
        $this->assign('username',Session::get('username'));
        $this->assign('head_picture',Session::get('head_picture'));
        return $this->fetch('detail');
    }
    public function slogin(){
        return $this->fetch('login');
    }
    public function login(){
        if (request()->post()) {
            $u_username = request()->post('username');
            $u_password = request()->post('password');
            if (empty($u_password) || empty($u_password)) {
                $this->error("用户名或密码不能为空");
            }
            $user_info = Db::name('user')->where('username', $u_username)->find();
            if (empty($user_info)) {
                $this->error("用户不存在，请重新登录");
            } else {
                if (md5($u_password) != $user_info['password']) {
                    $this->error("密码不正确，请重新登录");
                } else {
                    Session::set('username', $u_username,'think');
                    Session::set('head_picture',Db::name('user')->where('username',$u_username)->field('picture')->find());
                    $this->success("登录成功！", url('index/index/home'));
                }
            }
        }
    }
    public function register(){
        if(request()->isPost()){
            $user['username']=request()->post('username');
            $user['password']=request()->post('password');
            $repassword=request()->post('repassword');
            if(empty($user['username'])||empty($user['password'])||empty($repassword)){
                $this->error("用户名或密码不能为空");
            }
            if($user['password']!=$repassword){
                $this->error("两次密码不一致");
            }
            if(Db::name('user')->where('username',$user['username'])->find()){
                $this->error("此用户名已存在");
            }else{
                $user['password']=md5($user['password']);
                $user['picture']='c31007bccd127a58c41a50f29ddefe5.jpg';
                Session::start();
                Session::set('username',$user['username'],'think');
                Session::set('password',$user['password'],'think');
                Session::set('head_picture',$user['picture'],'think');
                Db::name('user')->insert($user);
                $this->success("注册成功,请登录");
            }
        }
    }
    public function logout(){
        if (request()->isGet()){
            Session::delete('username');
            Session::delete('head_picture');
            return $this->redirect(url('index/index/index'));
        }
    }
}
