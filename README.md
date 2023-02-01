# shf-project

## 尚好房项目 【二手房交易平台】

### 使用技术：

#### 后端：

**spring+springMVC+mybatis+maven+SpringSecurity**

**dubbo+zookeeper【微服务】**
**mysql+redis**
**七牛云**

#### 前端：

**thymeleaf+vue+jQuery+js+axios+后台框架**

### 启动：
1. **去七牛云官网注册，实名验证，拿自己的密钥去项目中修改，否则上传不了图片**
2. **导入项目到idea**

3. **修改项目中MySQL路径**

4. **开启redis【也要启动redis，不然报错！！！】,修改项目redis本地路径**

5. **配置zookeeper服务中心并开启该服务【一定先启动zookeeper，不然项目启动将报错！！！】**
![image](https://user-images.githubusercontent.com/120694353/215963075-84a5d3a7-72f6-4716-b4fb-3024cdae0f25.png)

6. **最后启动服务【本项目用jetty启动】**
  ![image](https://user-images.githubusercontent.com/120694353/215959472-2f5effa7-7a1b-44f9-8106-8d7f0004849e.png)
  ![image](https://user-images.githubusercontent.com/120694353/215959688-fc0ad93e-a133-4e12-8c9d-89314cc13720.png)
  ![image](https://user-images.githubusercontent.com/120694353/215960161-5057cea3-d9d7-48a2-92d2-bbd97d36a15b.png)
### 项目结构图：
#### 前台：
![image](https://user-images.githubusercontent.com/120694353/215963127-fc03ea76-9641-4ca9-ba97-2e449979b2b5.png)

#### 后台：
![image](https://user-images.githubusercontent.com/120694353/215963173-11e02da4-fcc2-4059-981c-8d6e05969e5b.png)
