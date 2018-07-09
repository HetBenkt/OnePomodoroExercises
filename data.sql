DROP TABLE IF EXISTS days;
DROP TABLE IF EXISTS exercises;

CREATE TABLE exercises (
  id              SERIAL    PRIMARY KEY UNIQUE  NOT NULL,
  excelrow        INT                           NOT NULL,
  name            CHAR(32)                      NOT NULL,
  description     CHAR(256)                     NOT NULL,
  image           CHAR(256)                     NOT NULL,
  weight          INT                           NOT NULL,
  category        CHAR(16)                      NOT NULL,
  sets            INT                           NOT NULL,
  reps            INT                           NOT NULL,
  units           CHAR(8)                       NOT NULL
);

CREATE TABLE days (
  id              SERIAL    PRIMARY KEY UNIQUE  NOT NULL,
  title           CHAR(32)                      NOT NULL,
  description     CHAR(256)                     NOT NULL,
  date            CHAR(16)                      NOT NULL,
  exercises       INT[]                         NOT NULL
);

INSERT INTO days (title, description, date, exercises) VALUES ('Day 1', 'Start of the 4 days exercises!', '2018-7-9', ARRAY[-2,15,18,19,22,34,39,44,52,67,70,104,107,109,-3]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 2', 'Almost half way!', '2018-7-10', ARRAY[-2,5,10,25,29,38,49,58,66,71,84,101,103,106,-4]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 3', '50% done...great work!', '2018-7-11', ARRAY[ -2,4,16,19,34,46,52,57,76,88,89,103,106,110,-3]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 4', 'Finish the sequence as a pro!', '2018-7-12', ARRAY[-2,6,17,25,29,38,54,58,66,71,86,102,105,108,-4]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 5', 'Your day off as earned!', '2018-7-13', ARRAY[-1]);

INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (-1, 'NO EXCISES TODAY', '', '', 0, 'FREE', 0, 0, '');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (-2, 'Shoulders, arms, legs', '', '', 0, 'WARMING-UP', 0, 0, '');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (-3, 'ARMS', '', '', 0, 'COOLING-DOWN', 1, 1, 'min');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (-4, 'LEGS', '', '', 0, 'COOLING-DOWN', 1, 1, 'min');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (4, 'Bird-dog', '', '', 1, '30 days', 1, 50, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (5, 'Bridge', '', '', 1, '30 days', 1, 65, 'sec');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (6, 'Bridge butt', '', '', 1, '30 days', 1, 24, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (10, 'Burpees easy', '', '', 1, '30 days', 1, 14, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (15, 'Crunches crossed-arms', '', '', 1, '30 days', 1, 34, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (16, 'Crunches long-arms', '', '', 1, '30 days', 1, 34, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (17, 'Crunches reversed', '', '', 1, '30 days', 1, 22, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (18, 'Donkeykick left/right', '', '', 1, '30 days', 1, 40, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (19, 'Firehydrant left/right', '', '', 1, '30 days', 1, 20, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (22, 'High stepping', '', '', 1, '30 days', 1, 48, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (25, 'Jumping jacks', '', '', 1, '30 days', 1, 74, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (29, 'Leglift side left/right', '', '', 1, '30 days', 1, 26, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (34, 'Lunges', '', '', 1, '30 days', 1, 28, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (38, 'Lunges cursty', '', '', 1, '30 days', 1, 40, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (39, 'Lunges kneehops left/right', '', '', 1, '30 days', 1, 24, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (44, 'Plank', '', '', 1, '30 days', 1, 75, 'sec');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (46, 'Plank side left/right', '', '', 1, '30 days', 1, 70, 'sec');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (49, 'Plank straight-arms', '', '', 1, '30 days', 1, 75, 'sec');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (52, 'Push-ups', '', '', 1, '30 days', 1, 18, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (54, 'Push-ups decline', '', '', 1, '30 days', 1, 18, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (57, 'Push-ups incline', '', '', 1, '30 days', 1, 18, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (58, 'Push-ups knee', '', '', 1, '30 days', 1, 28, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (66, 'Russian twist', '', '', 1, '30 days', 1, 46, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (67, 'Single calf raise left/right', '', '', 1, '30 days', 1, 24, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (70, 'Sit-ups', '', '', 1, '30 days', 1, 22, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (71, 'Squats', '', '', 1, '30 days', 1, 26, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (76, 'Squats split left/right', '', '', 1, '30 days', 1, 30, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (84, 'Superman', '', '', 1, '30 days', 1, 10, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (86, 'Triceps with chair', '', '', 1, '30 days', 1, 22, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (88, 'Wallclimbing', '', '', 1, '30 days', 1, 46, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (89, 'Wallsit', '', '', 1, '30 days', 1, 45, 'sec');

INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (101, 'Curls sitting', '', '', 1, 'Dumbbells', 3, 8, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (102, 'Curls standing', '', '', 1, 'Dumbbells', 3, 8, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (103, 'Curls concentration left/right', '', '', 1, 'Dumbbells', 3, 8, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (104, 'One arm swing left/right', '', '', 1, 'Dumbbells', 3, 6, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (105, 'Hammer', '', '', 1, 'Dumbbells', 3, 6, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (106, 'Flyes', '', '', 1, 'Dumbbells', 3, 4, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (107, 'Tricep extension', '', '', 1, 'Dumbbells', 3, 6, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (108, 'Chek press', '', '', 1, 'Dumbbells', 3, 4, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (109, 'Front ups left/right', '', '', 1, 'Dumbbells', 3, 4, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (110, 'Seated press', '', '', 1, 'Dumbbells', 3, 8, 'times');

SELECT * FROM days;
SELECT * FROM exercises;