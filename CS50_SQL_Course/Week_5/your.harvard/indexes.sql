CREATE INDEX "enrollment_course" ON "enrollments"("course_id");
CREATE INDEX "enrollment_student" ON "enrollments"("student_id");
CREATE INDEX "course_search" ON "courses"("id","department","number","semester");
CREATE INDEX "course_department" ON "courses"("department");
CREATE INDEX "course_title" ON "courses"("title");
CREATE INDEX "course_semester" ON "courses"("semester");
CREATE INDEX "satisfies_course" ON "satisfies"("course_id");
