# Rails Route + Controller exercise
### Routes

#### Resourse

- Giúp việc tạo các route phổ biến theo chuẩn RESTful một cách nhanh chóng. Cụ thể là 7 route khác nhau tương ứng với các action trong Order controller

```
resources :orders
```
##### Vi dụ :
```
   Prefix Verb    URI Pattern                Controller#Action
    orders GET    /orders(.:format)          orders#index
           POST   /orders(.:format)          orders#create
 new_order GET    /orders/new(.:format)      orders#new
edit_order GET    /orders/:id/edit(.:format) orders#edit
     order GET    /orders/:id(.:format)      orders#show
           PATCH  /orders/:id(.:format)      orders#update
           PUT    /orders/:id(.:format)      orders#update
           DELETE /orders/:id(.:format)      orders#destroy
```

#### Only/ Except
- Các controller được đặt trong only thì sẽ đc giữ lại dùng , còn lại loại bỏ tất cả . Đối với Except thì ngược lại , các controller được định nghĩa trong nó sẽ bị loại bỏ .

```
	resources :orders, only: %i(index show) // Only
    resources :orders, except: %i(index show) // Except
```
##### Vi dụ :
```
Only :
    Prefix Verb URI Pattern           Controller#Action
	orders GET  /orders(.:format)     orders#index
 	order  GET  /orders/:id(.:format)  orders#show
```
```
Except :
	Prefix Verb   URI Pattern                Controller#Action
    orders POST   /orders(.:format)          orders#create
 new_order GET    /orders/new(.:format)      orders#new
edit_order GET    /orders/:id/edit(.:format) orders#edit
     order PATCH  /orders/:id(.:format)      orders#update
           PUT    /orders/:id(.:format)      orders#update
           DELETE /orders/:id(.:format)      orders#destroy
```
#### Collection
- Loại bỏ tiền tố params id của resources cha khi kết hợp lồng nhau để dùng Nested.
```
resources :orders, only: %i(index show) do
   collection do
      patch :approve
      patch :reject
   end
end
```
##### Ví dụ :
```
Không có collection :
	Prefix Verb   URI Pattern                               Controller#Action
  order_approve   PATCH /orders/:order_id/approve(.:format) orders#approve
   order_reject   PATCH /orders/:order_id/reject(.:format)  orders#reject
         orders   GET   /orders(.:format)                   orders#index
          order   GET   /orders/:id(.:format)               orders#show
```
```
Có collection :
	Prefix Verb  URI Pattern                     Controller#Action
 approve_orders  PATCH /orders/approve(.:format) orders#approve
  reject_orders  PATCH /orders/reject(.:format)  orders#reject
        orders   GET   /orders(.:format)         orders#index
         order   GET   /orders/:id(.:format)     orders#show
```
#### Namespace
- Giúp thêm một tiền tố trước url routes và nhóm đối tượng đó theo url, namespace có mapping theo tứ tự thư mục ở controller .
```
namespace :admin do
  resources :orders, only: %i(index show) do
    collection do
      patch :approve
      patch :reject
    end
  end
end
```
#####  Ví dụ :
```
Prefix               Verb  URI Pattern                    Controller#Action
approve_admin_orders PATCH /admin/orders/approve(.:format)admin/orders#approve
 reject_admin_orders PATCH /admin/orders/reject(.:format)  admin/orders#reject
        admin_orders GET   /admin/orders(.:format)         admin/orders#index
         admin_order GET   /admin/orders/:id(.:format)     admin/orders#show
```
#### Nested
- Nested là một thuật ngữ khi ta lòng các resources với nhau . Nó có một điểm giống với namespace là đều thêm một tiền tố trước url . Điểm khác biết ở đây , nested vẩn giữ param id của mình sau tiền tố của resources cha và không cần phải phân cấp mapping với controller. Nếu muốn loại bỏ tiền tố đó ta có thể dùng thêm collection .
```
resources :admin do
  resources :orders, only: %i(index show)
end
```
#### Ví dụ :
```
Prefix Verb   URI Pattern                                  Controller#Action
admin_orders  GET    /admin/:admin_id/orders(.:format)     orders#index
 admin_order  GET    /admin/:admin_id/orders/:id(.:format) orders#show
 admin_index  GET    /admin(.:format)                      admin#index
              POST   /admin(.:format)                      admin#create
   new_admin  GET    /admin/new(.:format)                  admin#new
  edit_admin  GET    /admin/:id/edit(.:format)             admin#edit
       admin  GET    /admin/:id(.:format)                  admin#show
              PATCH  /admin/:id(.:format)                  admin#update
              PUT    /admin/:id(.:format)                  admin#update
              DELETE /admin/:id(.:format)                  admin#destroy
```
### Controller

#### Before Action
- Định nghĩa thứ tự thực hiện trước sau của các method trong controller . Có nghĩ khi ta kiểm tra hoặc thực hiện một thao tác gì đó khi vào một action, nếu không chỉ định các action được áp dụng thự thi sau khi check, thì nó sẽ áp dụng cho tất cả action controller.
```
before_action :authenticate_user!
```
#### Skip Action
- Skip action được dùng trong trường hợp ta đặt một before_action ở ở application controller , before này sẽ áp dụng cho tất cả các controller kế thừa nó , vậy trong trường hơp một trong các controller kia có các action không cần chạy quá before action kia thì ta dùng skip action trong controller đó .
```
skip_before_action :require_login, :except => [:landing, :connect, :create]
```
#### Strong params

- Nói nôm là giúp chúng ta khác phục được một trong những lỗi bảo mật đơn giản nhưng quang trọng . vidụ đoạn code này `user.update(params[:user])` nhìn thì thấy rất hợp lý và gọn , nhưng điều này ẩn chứa 1 lỗi khá nghiêm trọng, đó là ta không kiểm soát được những giá trị trong params. Nếu hacker thêm vào những giá trị không mong muốn vào , vi dụ set column role để đoạt quyền quảng trị chẳng hạn , trong trường hợp này thì strong params sẽ giúp bạn.
```
params.require(:user).permit(:name, :email)
```
#### Flash
- Giúp ta xuất một message cảnh báo trên ứng dụng của mình . Flash có 2 loại , `flash[:notice]` dùng cho phương thức chuyển trang `redirect_to` , flash.now dùng cho phương thức tạo response `render`
```
flash[:notice] = "Wellcome"
flash.now[:notice] = "Wellcome"
```
#### Transaction
- Transaction giúp toàn vẹn dữ liệu, các thay đổi trong cơ sở dữ liệu chỉ được giữ lại khi tất cả các câu lệnh SQL trong transaction đều được thực hiện thành công . Nếu có sự cố xãy ra khi thực hiện sẽ rollback hoàn trả tất cả gì đã thực hiện .
```
ActiveRecord::Base.transaction do
  save_order
end
```
#### Render/ Redirect_to
###### Render
- Gọi tới render sẽ tạo một response đầy đủ trả về cho browser. Nếu không chỉ rõ render trong controller action, Rails sẽ tự động tìm kiếm và render template tương ứng dựa vào tên controller action .
###### Redirect_to
- Khác với render công việc của redirect_to là điều hướng browser, yêu cầu browser tạo một request mới đến một URL khác.

`render :index`
`redirect_to index_url`