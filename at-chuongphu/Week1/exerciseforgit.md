# <span style="color:#e575b1"> Excercise 1	<span>
- **1**: 
- **2**: Repository là nơi chứa các thư mục của dự án có thể được lưu trữ trên máy tính và trên server chuyên dụng (vd: github). Cấu trúc bao gồm Object và index được lưu ẩn trong thư mục .git.
- **3**: Cách push code từ repository server:

        Bước 1: Khởi động terminal. 
        Bước 2: Từ terminal truy xuất tới thư mục dự án. 
        Bước 3: Dùng lệnh $ git init khởi chạy Repository từ thư mục cục bộ.             Bước 4: Sử dụng $ git add để theo dõi các tập tin trong thư mục.
        Bước 5: Xác nhận sự thay đổi bằng lệnh $ git commit -m "First Commit".
        Bước 6: Copy repository URL từ trang GitHub cá nhân
        Bước 7: Kết nối tư máy tính cục bộ với server thông qua dòng lệnh: $git remote add origin (đường dẫn URL lấy từ trang GitHub).
        Bước 8: Đẩy dữ liệu được thay đổi lên server: $git push origin master.
        
- **4**: Sự khác nhau giữa git merge và git rebase: sự khác nhau nhiều nhất khi làm việc trong một nhóm. Đối với git merge sự câp nhật tất cả sự thay đổi của nhánh (branch) và hơp nhất và các nhánh (branch) khác. Còn với git rebase chỉ cập nhật nhánh đã thay đổi của từng thành viên cụ thể không ảnh hưởng đến cập nhật của thành viên khác để tránh xảy ra sự xung đột. 
- **5**: Pull Request: Để nêu chi tiết các hành động chỉnh sửa đã được thực hiện để cho người quản lí hoặc thành viên trong nhóm xét duyện trước khi cập nhật vào dự án để đảm bảo tính ổn định cũng như đúng tiến trình. Cách tạo Pull Request: trước tiên cần có nhánh mới đã được đẩu (push) lên server từ desktop của người dùng. Tiếp theo ở trên github cá nhân, chúng ta có thể click nhãn Pull Request.  Trong đó mục compare để xác định nhánh cần cập nhật và base là nhánh đích để cập nhật. Tiếp theo nhập tiêu đề và mô tả chi tiết cần thiết. Cuối cùng, Send pull request để kết thúc quá trình pull request.
                   
