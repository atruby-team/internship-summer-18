# W5 - D4 - HoangTran - Rails Routes, Controller

## Routes
#### Resources:
  - Giúp tạo các Route phổ biến theo chuẩn RESTful nhanh chóng, tương ứng với các action trong Controller.
  - Ex: 
  ```ruby
  Rails.application.routes.draw do
    resources :users
  end
  ```
  ![alt](https://imgur.com/62Gx5D1)
  
#### Only/Except: 
  - Giới hạn route cần sử dụng.
    + Only: Chỉ dùng các route được khai báo trong Only
    ```ruby
    Rails.application.routes.draw do
      resources :users, only: [:index, :show]
    end
    ```
    ![alt](https://imgur.com/NAZkwqo)
    + Except: Dùng tất cả các route trừ route được khai báo trong Except.
    ```ruby
    Rails.application.routes.draw do
      resources :users, except: [:index, :show]
    end
    ```
    ![alt](https://imgur.com/OwvBEs7)
#### Collection:
  - Tạo thêm route và loại bỏ params của route cha.
  ```ruby
    Rails.application.routes.draw do
      resources :users, only: [:index, :show] do
        collection do
          get 'search'
        end
      end
    end
  ```
  ![alt](https://imgur.com/E0FD3XG)
#### Namespace:
  - Nhóm các controller trong 1 namespace, thêm tiền tố trước url mà không yêu cầu params.
  ```ruby
  Rails.application.routes.draw do
    namespace :admin do
      resources :users, only: [:index, :show]
    end
  end
  ```
  ![alt](https://imgur.com/62Gx5D1)

#### Nested:
 - Lồng các Routes với nhau, url của routes con sẽ chứa params id của routes cha.
 ```ruby
   Rails.application.routes.draw do
    resources :leaders do
      resources :users
    end
   end
 ```
 ![alt](https://imgur.com/7cPu59s)
## Controllers
#### Before_action:
  - Định nghĩa thứ tự thực hiện của các method, yêu cầu phải thực hiện method được khai báo trước khi thực hiện các method khác.
  ```ruby
  class ApplicationController < ActionController::Base
    before_action :require_login #Check login
 
    private
 
    def require_login 
      unless logged_in? 
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_login_url
      end
    end
  end
  ```
#### Skip_action:
 - Các method được khai báo có thể bỏ qua việc phải thực hiện method được yêu cầu trước và thực hiện luôn các method khác.
 ```ruby
  class LoginsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create] #skip check login in action new, create
  end
 ```
#### Strong Params
 - Dùng để ngăn chặn sự không kiểm soát được những giá trị trong params.
  ```ruby
  def person_params
    params.require(:user).permit(:name, :email)
  end
  ```
#### Flash:
 - Dùng để hiển thị message thông báo.
  ```ruby
  def login
    #login
    flash[:notice] = 'Login success'
    redirect_to @index
    end
  ```
#### Transaction:
  - Transaction giúp toàn vẹn dữ liệu, các thay đổi trong cơ sở dữ liệu chỉ thay đổi khi các câu lệnh trong transaction đều thực hiện thành công. Nếu có sự cố xảy ra khi thực hiện câu lệnh thì sẽ rollback dữ liệu.
  ```ruby
  ActiveRecord::Base.transaction do
    update_comment
  end
  ```
#### Render/Redirect_to:
  - Render: Gọi tới render sẽ tạo một reponse đầy đủ trả về brower. Nếu không chỉ rõ render trong controller action, Rails sẽ tự động tìm kiếm và render template tương ứng với tên trong controller action.
  - Redirect_to: Khác với render, redirect_to điều hướng brower, yêu cầu brower tạo một request mới đến một URL khác.
  ```ruby
  render :index
  redirect_to index_url
  ```
