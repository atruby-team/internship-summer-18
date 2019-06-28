## W5 - D4 - LuanTran - Rails Route + Controller exercise
### Routes
##### Resource
Example: `resources : articles`
![Alt text](https://github.com/atruby-team/internship-18-summer/blob/feature/at-luantran-rails-routes-controller-exercise/at-luantran/Week5/images/Screenshot%20from%202018-07-20%2016-37-09.png)
 >Tạo ra 7 routes khác nhau trong ứng dụng, tất cả sẽ mapping với article controller.
##### Only/ Except
Only :
Example: `resources :articles, only: :show`
![Alt text](https://github.com/atruby-team/internship-18-summer/blob/feature/at-luantran-rails-routes-controller-exercise/at-luantran/Week5/images/Screenshot%20from%202018-07-20%2016-39-05.png)
>Giới hạn các routes mình muốn tạo, chỉ tạo ra các routes nằm trong only.

Except:
Example: `resources :articles, except: :destroy`
![Alt text](https://github.com/atruby-team/internship-18-summer/blob/feature/at-luantran-rails-routes-controller-exercise/at-luantran/Week5/images/Screenshot%20from%202018-07-20%2016-40-03.png)
>Tạo ra đầy đủ các routes ngoại trừ các routes nằm trong except.
##### Collection
Example: 
``` ruby 
 resources :articles do
    collection do
      get 'search'
    end
  end
```
![Alt text](https://github.com/atruby-team/internship-18-summer/blob/feature/at-luantran-rails-routes-controller-exercise/at-luantran/Week5/images/Screenshot%20from%202018-07-20%2008-26-49.png)
>Tạo ra routes và đồng thời loại bỏ id của đối tượng cha trong URL.

##### Namespace
Example: 
``` ruby 
 namespace :admin do
    resources :articles
 end
```
![Alt text](https://github.com/atruby-team/internship-18-summer/blob/feature/at-luantran-rails-routes-controller-exercise/at-luantran/Week5/images/Screenshot%20from%202018-07-20%2008-38-19.png)
>- Cho phép chúng ta tổ chức và phân biệt rõ ràng trong cấu trúc và phần xử lý của ứng dụng.
>- Các view và controller riêng này sẽ nằm trong thư mục app/controller/namespace(admin) và app/view/namespace(admin) thay vì app/controller và app/view như bình thường.
>- URL sẽ thêm namespace (admin)ở trước.
##### Nested
``` ruby 
 resources :articles do 
    resources :comments
end
```
![Alt text](https://github.com/atruby-team/internship-18-summer/blob/feature/at-luantran-rails-routes-controller-exercise/at-luantran/Week5/images/Screenshot%20from%202018-07-20%2008-36-24.png)
>Tạo ra các routes lồng nhau, URL của routes con sẽ chứa id của đối tượng cha.
### Controller
##### Before_action
Example: `before_action :require_login`
>Yêu cầu phải thực hiện trước một hành động mới được được thực hiện hành động mong muốn.
##### Skip_action
Example: `skip_before_action :require_login, only: [:new, :create]`
>Các hành động được khai báo sẽ có thể bỏ qua việc thực hiện hành động yêu cầu trước và thực hiện luôn hành động mong muốn. 
##### Strong params
```ruby
  def person_params
    params.require(:user).permit(:name, :email)
  end
```
>Strong parameters ngăn chặn việc ta không kiểm soát được những giá trị trong params.

>**Cách dùng:**
>- require(:user) bắt buộc trong params phải có key là user
>- permit(:name, :email) trong key user chỉ cho phép name và email
##### Flash
>Dùng để hiển thị thông báo cho người dùng. Là một phần đặt biệt của session. Được hiển thị ở hành động tiếp theo và sau đó bị xóa đi.

Example:
```ruby
def create
  #save post
  flash[:notice] = "Post successfully created"
  redirect_to @post
end
```
>Khi thêm thành công sẽ hiển thị thông báo "Post successfully created"
##### Transaction
>Transaction giúp toàn vẹn dữ liệu, các thay đổi trong cơ sở dữ liệu chỉ được giữ lại khi tất cả các câu lệnh SQL trong transaction đều được thực hiện thành công. Vậy nên ta sẽ dùng transaction khi có 1 số thao tác với cơ sở dữ liệu mà yêu cầu tất cả các thao tác đó đều phải được thực hiện thành công.
> - Transaction không làm việc với nhiều kết nối cơ sở dữ liệu khác nhau
> - save và destroy tự động được gói lại trong 1 transaction
> - Xử lý ngoại lệ và rollback
> Khi có lỗi xảy ra trong một transaction, chỉ có ngoại lệ ActiveRecord::Rollback là không được ném ra ngoài, nhiệm vụ của nó là sẽ gọi ROLLBACK đưa cơ sở dữ liệu về trạng thái trước khi thực hiện transacion. Còn các ngoại lệ khác sẽ được "ném" ra ngoài transaction sau khi gọi ROLLBACK được gọi.
##### Render/ Redirect_to
>- Gọi tới render sẽ tạo một response đầy đủ trả về cho browser. Nếu không chỉ rõ render trong controller action, Rails sẽ tự động tìm kiếm và render template tương ứng dựa vào tên controller action.
>- Nếu bạn muốn render một view khác trong cùng controller, bạn có thể gọi render :action_name.
>- Ngoài ra bạn cũng có thể render các định dạng khác như XML, JSON, Status Codes, Text, ...
>- Khác với render công việc của redirect_to là điều hướng browser, yêu cầu browser tạo một request mới đến một URL khác. Ví dụ: redirect_articles_url. Hoặc tới một website khác redirect_to "https://google.com".
