<?php
/**
 * Created by PhpStorm.
 * User: sbpig
 * Date: 2019/10/15
 * Time: 15:37
 */
namespace app\index\controller;

use think\Db;
use think\Session;

class Personal extends \think\Controller
{
    public function caozuojiankong(){
        return $this->fetch();
    }
    public function kecheng(){
        return $this->fetch();
    }
    public function settings(){
        if(!Session::has('username')){
            return $this->redirect(url('index/index/index'));
        }
        $data=Db::name('user')->where('username',Session::get('username'))->find();
        $this->assign('head_picture',Session::get('head_picture'));
        $this->assign('usermsg',$data);
        return $this->fetch();
    }
    public function shoucang(){
        return $this->fetch();
    }
    public function tuichudenglu(){
        return $this->fetch();
    }
    public function xiugai(){
        return $this->fetch();
    }
    public function xuewan(){
    return $this->fetch();
    }
    public function personal(){
        if(!Session::has('username')){
            return $this->redirect(url('index/index/index'));
        }
        $data=Db::name('user')->where('username',Session::get('username'))->find();
        $this->assign('head_picture',Session::get('head_picture'));
        $this->assign('usermsg',$data);
        return $this->fetch();
    }
    public function zuijinliulang(){
        return $this->fetch();
    }
    public function modifyPersonal(){
        if(request()->isPost()){
            Db::name('user')->where('username',Session::get('username'))->update(request()->post());
            Session::set('username',request()->post('username'));
            return $this->redirect(url('index/personal/personal'));
        }
    }
    // 文件上传提交
    public function up()
    {
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
            $this->success('头像保存成功');
        } else {
            // 上传失败获取错误信息
            $this->error($file->getError());
        }
    }
    public function changePwd(){
        if (request()->isPost()){
            $data=request()->post();
            if(empty(request()->post('oldpwd'))&&empty(request()->post('password'))){
                return $this->error('请输入原密码和新密码');
            }
            $sql=Db::name('user')->where('username',Session::get('username'));
            $oldPassword=$sql->field('password')->find();
            $user['password']=md5($data['password']);
            if(md5($data['oldpwd'])==$oldPassword['password']){
                Db::name('user')->where('username',Session::get('username'))->update($user);
                return $this->success("修改成功",url('index/personal/personal'));
            }else{
                return $this->error('原密码输入错误');
            }
        }
    }
}
