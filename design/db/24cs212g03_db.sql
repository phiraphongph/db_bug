CREATE TABLE "users"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "created_at" DATE NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
CREATE TABLE "quiz"(
    "id" BIGINT NOT NULL,
    "created_by" BIGINT NOT NULL,
    "class_id" BIGINT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "created_at" DATE NOT NULL
);
ALTER TABLE
    "quiz" ADD PRIMARY KEY("id");
CREATE TABLE "questions"(
    "id" BIGINT NOT NULL,
    "quiz_id" BIGINT NOT NULL,
    "question_text" VARCHAR(255) NOT NULL,
    "answer" VARCHAR(255) NULL
);
ALTER TABLE
    "questions" ADD PRIMARY KEY("id");
CREATE TABLE "user_scores"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "quiz_id" BIGINT NOT NULL,
    "score" FLOAT(53) NOT NULL,
    "submitted_at" DATE NOT NULL
);
ALTER TABLE
    "user_scores" ADD PRIMARY KEY("id");
CREATE TABLE "user_answers"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "quiz_id" BIGINT NOT NULL,
<<<<<<< HEAD
    "questions_id" BIGINT NOT NULL,
=======
    "question_id" BIGINT NOT NULL,
>>>>>>> Initial commit
    "choice_id" BIGINT NOT NULL,
    "submitted_at" DATE NOT NULL
);
ALTER TABLE
    "user_answers" ADD PRIMARY KEY("id");
CREATE TABLE "class"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "created_by" BIGINT NOT NULL,
    "created_at" DATE NOT NULL
);
ALTER TABLE
    "class" ADD PRIMARY KEY("id");
CREATE TABLE "class_members"(
    "id" BIGINT NOT NULL,
    "class_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "role" VARCHAR(255) NOT NULL,
    "joined_at" DATE NOT NULL
);
ALTER TABLE
    "class_members" ADD PRIMARY KEY("id");
CREATE TABLE "question_choices"(
    "id" BIGINT NOT NULL,
    "question_id" BIGINT NOT NULL,
    "choice_text" VARCHAR(255) NOT NULL,
    "is_correct" BOOLEAN NOT NULL
);
ALTER TABLE
    "question_choices" ADD PRIMARY KEY("id");
<<<<<<< HEAD
=======
CREATE TABLE "tags"(
    "id" BIGINT NOT NULL,
    "tag_name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "tags" ADD PRIMARY KEY("id");
CREATE TABLE "question_tags"(
    "id" BIGINT NOT NULL,
    "question_id" BIGINT NOT NULL,
    "tag_id" BIGINT NOT NULL
);
ALTER TABLE
    "question_tags" ADD PRIMARY KEY("id");
>>>>>>> Initial commit
ALTER TABLE
    "class_members" ADD CONSTRAINT "class_members_class_id_foreign" FOREIGN KEY("class_id") REFERENCES "class"("id");
ALTER TABLE
    "user_scores" ADD CONSTRAINT "user_scores_quiz_id_foreign" FOREIGN KEY("quiz_id") REFERENCES "quiz"("id");
ALTER TABLE
    "questions" ADD CONSTRAINT "questions_quiz_id_foreign" FOREIGN KEY("quiz_id") REFERENCES "quiz"("id");
ALTER TABLE
    "question_choices" ADD CONSTRAINT "question_choices_question_id_foreign" FOREIGN KEY("question_id") REFERENCES "questions"("id");
ALTER TABLE
    "user_answers" ADD CONSTRAINT "user_answers_choice_id_foreign" FOREIGN KEY("choice_id") REFERENCES "question_choices"("id");
ALTER TABLE
<<<<<<< HEAD
=======
    "question_tags" ADD CONSTRAINT "question_tags_tag_id_foreign" FOREIGN KEY("tag_id") REFERENCES "tags"("id");
ALTER TABLE
    "question_tags" ADD CONSTRAINT "question_tags_question_id_foreign" FOREIGN KEY("question_id") REFERENCES "questions"("id");
ALTER TABLE
>>>>>>> Initial commit
    "user_answers" ADD CONSTRAINT "user_answers_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE
    "user_answers" ADD CONSTRAINT "user_answers_quiz_id_foreign" FOREIGN KEY("quiz_id") REFERENCES "quiz"("id");
ALTER TABLE
<<<<<<< HEAD
    "user_answers" ADD CONSTRAINT "user_answers_questions_id_foreign" FOREIGN KEY("questions_id") REFERENCES "questions"("id");
=======
    "user_answers" ADD CONSTRAINT "user_answers_question_id_foreign" FOREIGN KEY("question_id") REFERENCES "questions"("id");
>>>>>>> Initial commit
ALTER TABLE
    "quiz" ADD CONSTRAINT "quiz_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "users"("id");
ALTER TABLE
    "user_scores" ADD CONSTRAINT "user_scores_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE
    "class_members" ADD CONSTRAINT "class_members_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE
    "class" ADD CONSTRAINT "class_created_by_foreign" FOREIGN KEY("created_by") REFERENCES "users"("id");
ALTER TABLE
    "quiz" ADD CONSTRAINT "quiz_class_id_foreign" FOREIGN KEY("class_id") REFERENCES "class"("id");