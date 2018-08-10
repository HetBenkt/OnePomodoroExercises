DROP TABLE IF EXISTS days;
DROP TABLE IF EXISTS exercises;

CREATE TABLE exercises (
  id              SERIAL    PRIMARY KEY UNIQUE,
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
  id              SERIAL    PRIMARY KEY UNIQUE,
  title           CHAR(32)                      NOT NULL,
  description     CHAR(256)                     NOT NULL,
  date            CHAR(16)                      NOT NULL,
  exercises       INT[]                         NOT NULL
);

INSERT INTO days (title, description, date, exercises) VALUES ('Day 1', 'Start of the 3 days exercises!', '2018-8-10', ARRAY[-2,4,15,18,19,22,34,39,44,52,57,67,70,76,103,104,105,107,109,-3]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 2', 'Almost half way!', '2018-8-11'              , ARRAY[-2,5,10,16,25,29,34,49,52,58,66,71,84,88,101,102,103,106,110,-4]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 3', 'Finish the sequence as a pro!', '2018-8-12' , ARRAY[-2,6,17,19,25,29,38,46,54,58,66,71,86,89,101,102,105,106,108,-3]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 4', 'Your day off as earned!', '2018-8-13'       , ARRAY[-1]);

INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (-1, 'NO EXCISES TODAY', 'Have a nice day! :)', 'td_action_img/empty/icon.png', 0, 'FREE', 0, 0, '');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (-2, 'Shoulders, arms, legs', 'Roll the sholders; swing arms; lift legs and rotate body', 'td_action_img/empty/icon.png', 0, 'WARMING-UP', 1, 1, 'min');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (-3, 'ARMS', 'Stand straight and stretch arms front, back, top and behind head', 'td_action_img/empty/icon.png', 0, 'COOLING-DOWN', 1, 1, 'min');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (-4, 'LEGS & BEG', 'In sitting position touch your toes; stretch your beg', 'td_action_img/empty/icon.png', 0, 'COOLING-DOWN', 1, 1, 'min');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (4, 'Bird-dog', 'Sit on knees; knees under your butt; hands under shoulders; Stretch right leg en left arm at the same time; hold 5 sec. and repeat other side', 'td_action_img/bird_dog/icon.png', 1, '30 days', 1, 40, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (5, 'Bridge', 'Lie flat on floor, arms flat side body; lift but and keep back straight; hold the position', 'td_action_img/bridge/icon.png', 1, '30 days', 1, 45, 'sec');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (6, 'Bridge butt', 'Lie flat on floor, arms flat side body; lift but up and down', 'td_action_img/butt_bridge/icon.png', 1, '30 days', 1, 20, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (10, 'Burpees easy', 'Stand wide, put hands on the ground, kick feet backwards, do push-up, stand up and jump', 'td_action_img/burpee/icon.png', 1, '30 days', 1, 8, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (15, 'Crunches crossed-arms', 'Lie on back with crossed arms and bent knees; Lift upper body off the floor 30 degree; slowly back to start and repeat', 'td_action_img/cross_arm_crunch/icon.png', 1, '30 days', 1, 26, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (16, 'Crunches long-arms', 'Lie on back with stretched arms and bent knees; Lift upper body off the floor 30 degree; slowly back to start and repeat', 'td_action_img/long_arm_crunch/icon.png', 1, '30 days', 1, 12, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (17, 'Crunches reversed', 'Lie on back with hands behind ears, legs up and bent knees 90 degree; Lift upper body and thight; then stretch out and repeat', 'td_action_img/reverse_crunch/icon.png', 1, '30 days', 1, 16, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (18, 'Donkeykick left/right', 'Sit on knees; knees under your butt; hands under shoulders; Lift one leg and squeeze butt; go back and repeat', 'td_action_img/donkey_kick_right/icon.png', 1, '30 days', 1, 34, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (19, 'Firehydrant left/right', 'Sit on knees; knees under your butt; hands under shoulders; Lift leg to the side at 90 degree angle', 'td_action_img/fire_hydrant_right/icon.png', 1, '30 days', 1, 16, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (22, 'High stepping', 'Run in place while pulling knees as high as possible with each step; keep upper body upright', 'td_action_img/high_knees/icon.png', 1, '30 days', 1, 42, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (25, 'Jumping jacks', 'Start with your feet together and arms by your sides; jump up with feet apart and hands overhead; return to start and repeat', 'td_action_img/jumping_jacks/icon.png', 1, '30 days', 1, 62, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (29, 'Leglift side left/right', 'Lie down on your side with your gead rested on your arm; lift upper leg and return to start position; keep leg straight; switch side and repeat', 'td_action_img/side_leg_lift_right/icon.png', 1, '30 days', 1, 20, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (34, 'Lunges', 'Stand straight, put hands on hips; take step forward and lower body until thigh is parallel with floor. Return and switch to other leg', 'td_action_img/lunge/icon.png', 1, '30 days', 1, 20, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (38, 'Lunges cursty', 'Stand straight; Step back with one leg to the right and bent knees the same time; go back and switch other side', 'td_action_img/curtsy_lunge/icon.png', 1, '30 days', 1, 30, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (39, 'Lunges kneehops left/right', 'Stand straight; step one leg back and lower body; when getting back up raise knee up high', 'td_action_img/lunge_knee_hops_right/icon.png', 1, '30 days', 1, 16, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (44, 'Plank', 'Lie straight with both forearms supporting body; hold position', 'td_action_img/plank/icon.png', 1, '30 days', 1, 45, 'sec');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (46, 'Plank side left/right', 'Lie on side with forearm supporting body; hold position', 'td_action_img/right_side_plank/icon.png', 1, '30 days', 1, 40, 'sec');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (49, 'Plank straight-arms', 'Lie straight with both arms stretched supporting body; hold position', 'td_action_img/straight_arm_plank/icon.png', 1, '30 days', 1, 45, 'sec');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (52, 'Push-ups', 'Lie prone with both arms stretched supporting body; lower body with arms', 'td_action_img/push_up/icon.png', 1, '30 days', 1, 14, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (54, 'Push-ups decline', 'Lie prone with both arms stretched supporting body and feet on table; lower body with arms', 'td_action_img/decline_push_up/icon.png', 1, '30 days', 1, 14, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (57, 'Push-ups incline', 'Lie prone with both arms stretched supporting body on table; lower body with arms', 'td_action_img/incline_push_up/icon.png', 1, '30 days', 1, 14, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (58, 'Push-ups knee', 'Lie prone with both arms stretched supporting body and knees on the groud; lower body with arms', 'td_action_img/knee_push_up/icon.png', 1, '30 days', 1, 20, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (66, 'Russian twist', 'Sit tilted back on the floor with knees bent and feet lifted; Hold hands together and twist from side to side', 'td_action_img/russian_twist/icon.png', 1, '30 days', 1, 32, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (67, 'Single calf raise left/right', 'Stand with arms against the wall; Put your right foot on your left enkle, then lift your heel up and down; now switch foot and repeat', 'td_action_img/single_leg_calf_raise_right/icon.png', 1, '30 days', 1, 20, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (70, 'Sit-ups', 'Lie on back with hands behind ears, bent knees and feet on the ground; Lift upper body off the floor and slowly up to the setting position; slowly back to start and repeat', 'td_action_img/sit_ups/icon.png', 1, '30 days', 1, 16, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (71, 'Squats', 'Stand wide and arms stretched forward; lower body till thighs are parallel with floor; return to start position and repeat', 'td_action_img/squat/icon.png', 1, '30 days', 1, 20, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (76, 'Squats split left/right', 'Take a big step foreward and keep body straight; lower body and go back up; repeat', 'td_action_img/split_squat_right/icon.png', 1, '30 days', 1, 24, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (84, 'Superman', 'Lie on stomach with arms extended straigth overhead; Raise both arms and legs up off the floor; hold for 2 sec. return and repeat', 'td_action_img/superman/icon.png', 1, '30 days', 1, 8, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (86, 'Triceps with chair', 'Sit on chai and move your hip off the chai with your hands holding the chair edge; Slowly bend and stretch arms to make your body go up and down', 'td_action_img/triceps_dip_on_chair/icon.png', 1, '30 days', 1, 18, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (88, 'Wallclimbing', 'Lie straight with both arms stretched supporting body; Bent one knee towards chest; Then quickly switch from one leg to the other', 'td_action_img/mountain_climber/icon.png', 1, '30 days', 1, 42, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (89, 'Wallsit', 'Start with back on the wall; slide down knees 90 degree; keep back to the wall and arms closed; hold position', 'td_action_img/wall_sit/icon.png', 1, '30 days', 1, 35, 'sec');

INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (101, 'Curls sitting', 'Sit on chair; keep elbows close to body and palms towards legs; do not move upper arm; raise hand to shoulder; rotate arm when palms facing to shoulder', 'exicons/2.png', 1, 'Dumbbells', 3, 12, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (102, 'Curls standing', 'Stand straight; keep elbows close to body and palms towards legs; do not move upper arm; raise hand to shoulder; rotate arm when palms facing to shoulder', 'exicons/1.png', 1, 'Dumbbells', 3, 14, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (103, 'Curls concentration left/right', '', 'exicons/4.png', 1, 'Dumbbells', 3, 7, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (104, 'One arm swing left/right', '', 'exicons/18.png', 1, 'Dumbbells', 3, 6, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (105, 'Hammer', '', 'exicons/3.png', 1, 'Dumbbells', 3, 7, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (106, 'Flyes', 'Stand straight and slightly bend elbows; slowly upper arms sidewards until head level; hold 1 sec. and return and repeat', 'exicons/11.png', 1, 'Dumbbells', 3, 6, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (107, 'Tricep extension', '', 'exicons/6.png', 1, 'Dumbbells', 3, 6, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (108, 'Chek press', '', 'exicons/10.png', 1, 'Dumbbells', 3, 4, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (109, 'Front ups left/right', '', 'exicons/26.png', 1, 'Dumbbells', 3, 6, 'times');
INSERT INTO exercises (excelrow, name, description, image, weight, category, sets, reps, units) VALUES (110, 'Seated press', '', 'exicons/9.png', 1, 'Dumbbells', 3, 6, 'times');

SELECT * FROM days;
SELECT * FROM exercises;
SELECT name, sets || ' x ' || reps || ' ' || units, category, weight, image FROM exercises;
SELECT d.title, e.category, e.name, e.excelrow from exercises e, days d where e.excelrow = ANY(d.exercises) and e.category in ('30 days') order by d.title, e.excelrow
SELECT excelrow, 'Is a not used exercise in days' from exercises except select distinct unnest(exercises), 'Is a not used exercise in days' FROM days;