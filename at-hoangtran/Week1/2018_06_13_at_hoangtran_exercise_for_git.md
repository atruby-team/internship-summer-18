####1. Sự khác nhau giữa **commit -m "Message"** và **commit -am "Message"**
#####**Commit -m "Message"**
Tạo ra 1 commit mới và lưu trữ vào repo các thay đổi sau khi `add` kèm một "Message"
#####**Commit -am "Message"**
Nếu file ở trạng thái `modifiled`, khi chuyển qua trạng thái `unmodifiled` thì có thể bỏ qua bước `add` bằng `commit -am`.

####2. Repository là gì?
Repo là nơi lưu trữ source code của dự án.
Có 2 loại repo là **local repo** và **remote repo**.
- **Local repo** là nơi lưu trữ source code trên máy local của người lập trình, có thể đồng bộ hóa với remote repo bằng các lệnh git.
- **Remote repo** là nơi lưu trữ source code trên server. Ví dụ như Github,...

####3. Các bước để push code lên repository server
B1: `git add .`: đưa các tài nguyên mới, vùng thay đổi (untracked, modifiled) sang vùng theo dõi git (staged).
B2: `git commit -m "Message"`: Lưu lại thay đổi kèm theo Message
B3: `git push ten-remote ten-nhanh`: Đẩy source code lên remote r.

####4. So sánh git merge và git rebase
#####Giống nhau: Dùng để gộp nhánh này vào nhánh khác.
#####Khác nhau:
- **Merge**: Tạo 1 commit mới trên nhánh vừa được merge. Lịch sử commit được sắp xếp tuần tự.
- **Rebase**: Không tạo commit mới. Lịch sử commit được nối tiếp để luôn luôn mới nhất.

####5. Pull Request là gì? Làm cách nào để tạo PR
#####Pull Request:
- Là yêu cầu gộp 1 branch vào nhánh master.
#####Cách tạo PR:
B1: Tạo branch mới và đẩy source code mới lên nhánh đó.
B2: Vào Github sẽ hiện lên nhánh vừa tạo. Ấn vào nút New Pull Request.
B3. Viết Title và Description.
B4. Ấn Create New Pull Request.

####6. Tìm hiểu cách viết Markdown và đưa  ra một số cú pháp Markdown
#####Một số cú pháp Markdown:
- #: Tiêu đề, 1# tương ứng với `h1`, 2# tương ứng với `h2`, cứ thế tăng dần số # tương ứng với `h`
- `*text*`, `_text_`: In nghiêng
- `**text**`, `__text__`: In đậm 
- `***text***`: Vừa in nghiêng vừa in đậm
- ` `` `: Dùng để bao 1 dòng mã lệnh
- ``` code ```: Dùng để bao cho nhiều dòng mã lệnh
- ` -, * `: Để tạo list danh sách dạng <.>
- ` <1..5> `: Để tạo list danh dách dạng số
- ` [title](link) `: Tạo liên kết
- ` ![alt](link) `: Dùng để chèn hình
- ` *** `: Dùng để horizonal rules
- ` \*text* `: Dùng để sử dụng các kí hiệu trùng với cú pháp Markdown
