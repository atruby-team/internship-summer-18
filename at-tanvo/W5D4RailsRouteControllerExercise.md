# W5 - D4 - Rails Route + Controller Exercise

### Resource
- Resourece routing cho phép thiết lập mặc định tạo các router theo chuẩn RESTful . Cụ thể là 7 route index, show, new, edit, create, update và destroy tương ứng với các action trong User controller.
### Only/ Except
- Nếu chỉ muốn sử dụng một route từ các route mặc định ta sử dụng Only . Còn nếu muốn loại bỏ route khác ra khỏi các route mặc định ta sử dụng Except
### Collection
- Example : 'photos/:id/:user_id'
- Sử dụng collection giúp ta thực hiện action DELETE /posts/:id loại bỏ :id ra khỏi URL
### Namespace
- Namespace cho phép chúng ta tổ chức và phân biệt rõ ràng trong cấu trúc và xử lý của ứng dụng . Giả xử trong một ứng dụng có những chức năng mà chỉ cho phép admin mới được quyền sử dụng. Điều này sẽ dẫn đến việc tồn tại các view và controller độc lập với các view và controller sẵn có. Ta sử dụng các view và controller đó để khai báo các chức năng cho admin.
### Nested
- Nested routes cho phép ta lồng các mối quan hệ trong việc routing của mình . 
- Ví dụ : 
```ruby
Resources :magazines do 
  Resources :ads 
end
```
- Ngoài việc tạo các routes cho magazines, khai báo này sẽ route ads của ads . URL của magazines sẽ có dạng /magazines/:magazine_id/ads 
### Before_action
- Là một method filter của một controller action. Chúng ta có thể sự dụng before_action trong trường hợp yêu cầu người dùng đăng nhập trước khi sử dụng các tính năng của trang web. Ta có thể định nghĩa phương thức kiểm tra login người dùng , và khi chạy tính năng sử dụng before_action để gọi phương thúc kiểm tra login trước khi thực hiện tính năng đó.
### Skip_action
- Thông thường filter được đặt ở ApplicationController do đó tất cả controller sẽ thừa kế filter đó . Giống như trường hợp check_login ở trên , Nó sẽ khiến mọi chức năng trong ứng dụng đều yêu cầu user phải log in trước khi sử dụng . Vậy nên ta sử dụng skip action để chỉ thị những trường hợp cần chạy filter .
```ruby 
class LoginsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
end
```
- Ở ví dụ trên LoginsController new và create sẽ thực hiện mà không cần yêu cầu user phải log in.
### Strong params
- Strong params cho phép các parameters ở Controller tạm bị cấm sử dụng ở Model đến khi chúng được cho phép. Nghĩa là phải đưa quyết định cho những attributes cho phép update. Đây là phương pháp bảo mật tốt hơn để giúp ngăn chặn user update những attribute nhạy cảm .
### Flash
- Flash giúp chúng ta hiền thị một thông báo trên ứng dụng .
```ruby

class LoginsController < ApplicationController
  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end
```
Khi user thực hiện log out . Controller sẽ gửi 1 message thông báo "You have successfully logged out" khi user thực hiện thành công hành động log out.

### Transaction
- Transaction giúp toàn vẹn dữ liệu, các thay đổi trong cơ sở dữ liệu chỉ được giữ lại khi tất cả các câu lệnh SQL trong transaction đều được thực hiện thành công. Vậy nên ta sẽ dùng transaction khi có 1 số thao tác với cơ sở dữ liệu mà yêu cầu tất cả các thao tác đó đều phải được thực hiện thành công.
### Render/ Redirect_to
- Hai phương thức Render và Redirect_to đều xuất hiện ở cuối các action của controller, tạo HTTP response để trả về và sau cùng đều hiển thị view mới trên web browser.
- Gọi tới render sẽ tạo một response đầy đủ trả về cho browser. Nếu không chỉ rõ render trong controller action, Rails sẽ tự động tìm kiếm và render template tương ứng dựa vào tên controller action.
- Khác với render công việc của redirect_to là điều hướng browser, yêu cầu browser tạo một request mới đến một URL khác. Ví dụ: redirect_to photos_url. Hoặc tới một website khác redirect_to "https://google.com".





