# W3 - D2 Chuong Phu Q - Syntax, Data Structure
##### Excercise 1: Forum
Class `Discussion`
  * view_discussion: Xem các câu hỏi và câu trả lời.
  * post_discussion: Đăng bài lên forum.
  * comment_discussion: Bình luận và trả lời trên forum.
  * edit_post: Chỉnh sửa bài đăng.
  * remove_post: Xóa bài đăng.
  * edit_comment: Chỉnh sửa bình luận.
  * remove_comment: Xóa bình luận.

Class `Article`
  * add_new_article: Thêm mới một bài viết.
  * update_article: Cập nhật bài viết.
  * remove_article: Xóa bài viết.
  * approve_article: Bài viết qua kiểm duyệt.
  * rate_article: Đánh giá bài viết.

Class `Categories`
  * add_category: Thêm danh mục bài viết.
  * edit_category: Chỉnh sửa danh mục bài viết.
  * remove_category: Xóa danh mục bài viết.
  * search_category: Tìm kiếm danh mục bài viết.

Class `User`
  * create_new_user: Tạo mới một tài khoản người dùng.
  * update_user: Cập nhật thông tin người dùng.
  * remove_user: Xóa tài khoản người dùng.
  * search_user: Tìm kiếm người dùng.

Class `Permission`
  * user_role: Quyền truy cập giữa admin và người dùng.
  * login: Đăng nhâp tùy theo tài khoản.
  * logout: Đăng xuất tùy theo tài khoản.

##### Excercise 2: Comment for the lines following:
  * a = 20 #a: pizza bình thường
  * b = 18 #b: pizza đặc biệt
  * c = a + b #c: combo: 2 pizza + 1 nước
  * d = a * 3 + b #d: combo family: 4 pizza + 4 nước
  * e = (c + d) / 2 #e: combo coupe: 2 pizza + 2 nước + 1 món tráng miệng

##### Excercise 3: The Institute maintains a list of lecturer names and areas of interest, for example:
>Paul Barry => Programming, Networking, Security, Open Source, Frameworks.
Chris Meudec => Testing, Safety Systems, Formal Systems, Programming Languages.
Nigel Whyte => Graphics, Imaging, Programming, Sign Language, Trees.
Austin Kinsella => Networks, WANs, Programming, Macintosh, Digital Photography.
Gerry Moloney ­=> Placement, Employment, Emerging Systems, Web Development.

* Write a Ruby data structure to hold this data.
 
lecturer [

  {name: 'Paul Barry', interested: ['Programming', 'Networking', 'Security', 'Open Source', 'Frameworks']},
  
  {name: 'Chris Meudec, interested: ['Testing', 'Safety Systems', 'Formal Systems', 'Programming Language']},
  
  {name: Austin Kinsella', interested: ['Networks', 'WANs', 'Programming', 'Macintosh', 'Digital Photgraphy']},
  
  {name: Gerry Meloney, interested: ['Placemeny', 'Employment', 'Emerging Systems', 'Web Development']}
  
]

* Show list areas of interest of the first and third lecturers.

puts lecturer[0] [:interested]

puts lecturer[2] [:interested]

* Remove the last lecturer.

lecturer.delete_at(lecturer.length-1)
