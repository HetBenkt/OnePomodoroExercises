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

-- Dag 1 (maandag) – borst & triceps.
-- Dag 2 (woensdag) – rug & biceps.
-- Dag 3 (vrijdag) – benen & schouders.
-- INSERT INTO days (title, description, date, exercises) VALUES ('Day 1', 'Start of the 3 days exercises! [CHEST, TRICEPS]', '2018-10-29', ARRAY[-2,10,52,54,57,58,86,104,107,112,113,15,66,25,19,44,-3]);--17
-- INSERT INTO days (title, description, date, exercises) VALUES ('Day 2', 'Almost half way! [BEG, BICEPS]', '2018-10-31'                 , ARRAY[-2,4,5,6,18,84,111,114,101,102,103,105,16,70,25,29,46,-4]);--18
-- INSERT INTO days (title, description, date, exercises) VALUES ('Day 3', 'Finish the sequence as a pro! [LEGS, SHOULDERS]', '2018-11-2' , ARRAY[-2,22,34,38,39,67,71,76,89,106,108,109,110,17,88,25,30,49,-5]);--19

-- Dag 1: Borst en rug
-- Dag 2: Bovenbenen, kuiten, buikspieren
-- Dag 3: Schouders en armen
-- INSERT INTO days (title, description, date, exercises) VALUES ('Day 1', 'Start of the 3 days exercises! [CHEST, BEG]', '2018-10-29'   , ARRAY[-2,10,52,54,57,58,4,5,6,18,84,111,114,25,19,44,-3]);--17
-- INSERT INTO days (title, description, date, exercises) VALUES ('Day 2', 'Almost half way! [LEGS, BELLY]', '2018-10-31'                , ARRAY[-2,22,34,38,39,67,71,76,89,15,16,17,66,70,88,25,29,46,-4]);--19
-- INSERT INTO days (title, description, date, exercises) VALUES ('Day 3', 'Finish the sequence as a pro! [SHOULDERS, ARMS]', '2018-11-2', ARRAY[-2,106,108,109,110,101,102,103,105,86,104,107,112,113,25,30,49,-5]);--18

-- Dag 1 (maandag) – chest & triceps.
-- Dag 2 (woensdag) – beg & biceps.
-- Dag 3 (vrijdag) – legs & shoulders.
-- Dag 4 (zaterdag) – biceps & triceps.
INSERT INTO days (title, description, date, exercises) VALUES ('Day 1', 'Start of the 4 days exercises! [CHEST & TRICEPS]', '2018-12-10', ARRAY[-2,25,52,104,115,107,57,113,29,86,5,103,106,46,-3]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 2', 'Almost half way! [BEG & BICEPS]', '2018-12-12'                 , ARRAY[-2,25,4,105,114,103,84,102,111,18,6,112,109,44,-4]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 3', 'Half way done! [LEGS & SHOULDERS]', '2018-12-14'               , ARRAY[-2,25,34,110,71,106,76,109,67,30,5,102,113,49,-5]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 4', 'Finish the sequence as a pro! [BICEPS & TRICEPS]', '2018-12-15', ARRAY[-2,25,105,107,103,104,101,112,19,86,6,106,115,44,-6]);


INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-1, 'NO EXCISES TODAY'            , 'td_action_img/empty/icon.png'                      , 0, 'FREE'           , 0,  0, '', 'Have a nice day! :)');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-2, 'Shoulder, arm, leg, wrist'   , 'td_action_img/empty/icon.png'                      , 0, 'WARMING-UP'     , 1,  1, 'min', 'Roll shoulders; cross arms; lift legs; rotate body; rotate wrist');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-3, 'ARMS & KNEES'                , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'   , 1,  1, 'min', 'Stand straight and stretch arms front, back, top and behind head');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-4, 'LEGS & BEG'                  , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'   , 1,  1, 'min', 'In sitting position touch your toes; stretch your beg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-5, 'ARMS & LEGS'                 , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'   , 1,  1, 'min', 'Stand straight and stretch arms front, back, top and behind head; In sitting position touch your toes; stretch your beg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-6, 'KNEES & BEG'                 , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'   , 1,  1, 'min', 'Stand straight and stretch arms front, back, top and behind head; In sitting position touch your toes; stretch your beg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (4 , 'Bird-dog'                    , 'td_action_img/bird_dog/icon.png'                   , 1, '30 days Beg'    , 1, 44, 'times', 'Sit on knees; knees under your butt; hands under shoulders; Stretch right leg en left arm at the same time; hold 5 sec. and repeat other side');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (5 , 'Bridge'                      , 'td_action_img/bridge/icon.png'                     , 1, '30 days Butt'   , 1, 60, 'sec', 'Lie flat on floor, arms flat side body; lift but and keep back straight; hold the position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (6 , 'Bridge butt'                 , 'td_action_img/butt_bridge/icon.png'                , 1, '30 days Butt'   , 1, 22, 'times', 'Lie flat on floor, arms flat side body; lift but up and down');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (10, 'Burpees easy'                , 'td_action_img/burpee/icon.png'                     , 1, '30 days Chest'  , 3,  4, 'times', 'Stand wide, put hands on the ground, kick feet backwards, do push-up, stand up and jump');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (15, 'Crunches crossed-arms'       , 'td_action_img/cross_arm_crunch/icon.png'           , 1, '30 days Abs'    , 1, 30, 'times', 'Lie on back with crossed arms and bent knees; Lift upper body off the floor 30 degree; slowly back to start and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (16, 'Crunches long-arms'          , 'td_action_img/long_arm_crunch/icon.png'            , 1, '30 days Abs'    , 1, 18, 'times', 'Lie on back with stretched arms and bent knees; Lift upper body off the floor 30 degree; slowly back to start and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (17, 'Crunches reversed'           , 'td_action_img/reverse_crunch/icon.png'             , 1, '30 days Abs'    , 1, 18, 'times', 'Lie on back with hands behind ears, legs up and bent knees 90 degree; Lift upper body and thight; then stretch out and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (18, 'Donkeykick left/right'       , 'td_action_img/donkey_kick_right/icon.png'          , 1, '30 days Butt'   , 1, 20, 'times', 'Sit on knees; knees under your butt; hands under shoulders; Lift one leg and squeeze butt; go back and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (19, 'Firehydrant left/right'      , 'td_action_img/fire_hydrant_right/icon.png'         , 1, '30 days Butt'   , 1, 10, 'times', 'Sit on knees; knees under your butt; hands under shoulders; Lift leg to the side at 90 degree angle');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (22, 'High stepping'               , 'td_action_img/high_knees/icon.png'                 , 1, '30 days Legs'   , 1, 20, 'times', 'Run in place while pulling knees as high as possible with each step; keep upper body upright');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (25, 'Jumping jacks'               , 'td_action_img/jumping_jacks/icon.png'              , 1, 'WARMING-UP'     , 1, 54, 'times', 'Start with your feet together and arms by your sides; jump up with feet apart and hands overhead; return to start and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (29, 'Leg lift side left/right'    , 'td_action_img/side_leg_lift_right/icon.png'        , 1, '30 days Butt'   , 1, 16, 'times', 'Lie down on your side with your head rested on your arm; lift upper leg and return to start position; keep leg straight; switch side and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (30, 'Leg circles side left/right' , 'td_action_img/side_leg_circles_right/icon.png'     , 1, '30 days Butt'   , 1, 16, 'times', 'Lie down on your side with your head rested on your hand; lift upper leg and rotate; keep leg straight; switch side and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (34, 'Lunges'                      , 'td_action_img/lunge/icon.png'                      , 1, '30 days Legs'   , 3,  8, 'times', 'Stand straight, put hands on hips; take step forward and lower body until thigh is parallel with floor. Return and switch to other leg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (38, 'Lunges cursty'               , 'td_action_img/curtsy_lunge/icon.png'               , 1, '30 days Legs'   , 3, 10, 'times', 'Stand straight; Step back with one leg to the right and bent knees the same time; go back and switch other side');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (39, 'Lunges kneehops left/right'  , 'td_action_img/lunge_knee_hops_right/icon.png'      , 1, '30 days Legs'   , 3,  7, 'times', 'Stand straight; step one leg back and lower body; when getting back up raise knee up high');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (44, 'Plank'                       , 'td_action_img/plank/icon.png'                      , 1, '30 days Abs'    , 1, 65, 'sec', 'Lie straight with both forearms supporting body; hold position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (46, 'Plank side left/right'       , 'td_action_img/right_side_plank/icon.png'           , 1, '30 days Abs'    , 1, 70, 'sec', 'Lie on side with forearm supporting body; hold position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (49, 'Plank straight-arms'         , 'td_action_img/straight_arm_plank/icon.png'         , 1, '30 days Abs'    , 1, 80, 'sec', 'Lie straight with both arms stretched supporting body; hold position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (52, 'Push-ups'                    , 'td_action_img/push_up/icon.png'                    , 1, '30 days Chest'  , 3,  0, 'times', 'Lie prone with both arms stretched supporting body; lower body with arms');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (54, 'Push-ups decline'            , 'td_action_img/decline_push_up/icon.png'            , 1, '30 days Chest'  , 3,  0, 'times', 'Lie prone with both arms stretched supporting body and feet on table; lower body with arms');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (57, 'Push-ups incline'            , 'td_action_img/incline_push_up/icon.png'            , 1, '30 days Chest'  , 3,  0, 'times', 'Lie prone with both arms stretched supporting body on table; lower body with arms');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (58, 'Push-ups knee'               , 'td_action_img/knee_push_up/icon.png'               , 1, '30 days Chest'  , 3,  0, 'times', 'Lie prone with both arms stretched supporting body and knees on the groud; lower body with arms');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (66, 'Russian twist'               , 'td_action_img/russian_twist/icon.png'              , 1, '30 days Abs'    , 1, 50, 'times', 'Sit tilted back on the floor with knees bent and feet lifted; Hold hands together and twist from side to side');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (67, 'Calf raise'                  , 'td_action_img/single_leg_calf_raise_right/icon.png', 1, '30 days Legs'   , 3, 10, 'times', 'Stand with arms against the wall; Put your right foot on your left enkle, then lift your heel up and down; now switch foot and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (70, 'Sit-ups'                     , 'td_action_img/sit_ups/icon.png'                    , 1, '30 days Abs'    , 1, 18, 'times', 'Lie on back with hands behind ears, bent knees and feet on the ground; Lift upper body off the floor and slowly up to the setting position; slowly back to start and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (71, 'Squats'                      , 'td_action_img/squat/icon.png'                      , 1, '30 days Legs'   , 3,  9, 'times', 'Stand wide and arms stretched forward; lower body till thighs are parallel with floor; return to start position and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (76, 'Squats split left/right'     , 'td_action_img/split_squat_right/icon.png'          , 1, '30 days Legs'   , 3,  8, 'times', 'Take a big step foreward and keep body straight; lower body and go back up; repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (84, 'Superman'                    , 'td_action_img/superman/icon.png'                   , 1, '30 days Beg'    , 1, 10, 'times', 'Lie on stomach with arms extended straigth overhead; Raise both arms and legs up off the floor; hold for 2 sec. return and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (86, 'Triceps with chair'          , 'td_action_img/triceps_dip_on_chair/icon.png'       , 1, '30 days Triceps', 1, 20, 'times', 'Sit on chai and move your hip off the chai with your hands holding the chair edge; Slowly bend and stretch arms to make your body go up and down');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (88, 'Wallclimbing'                , 'td_action_img/mountain_climber/icon.png'           , 1, '30 days Abs'    , 1, 50, 'times', 'Lie straight with both arms stretched supporting body; Bent one knee towards chest; Then quickly switch from one leg to the other');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (89, 'Wallsit'                     , 'td_action_img/wall_sit/icon.png'                   , 1, '30 days Legs'   , 1, 45, 'sec', 'Start with back on the wall; slide down knees 90 degree; keep back to the wall and arms closed; hold position');

INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (101, 'Curls sitting'                 , 'exicons/2.png' , 1, 'DB Biceps'   ,3, 13, 'times', 'Sit on chair; keep elbows close to body and palms towards legs; do not move upper arm; raise hand to shoulder; rotate arm when palms facing to shoulder');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (102, 'Curls standing '               , 'exicons/1.png' , 1, 'DB Biceps'   ,3, 13, 'times', 'Stand straight; keep elbows close to body and palms towards legs; do not move upper arm; raise hand to shoulder; rotate arm when palms facing to shoulder');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (103, 'Curls concentration left/right', 'exicons/4.png' , 1, 'DB Biceps'   ,3, 13, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (105, 'Hammer'                        , 'exicons/3.png' , 1, 'DB Biceps'   ,3, 13, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (106, 'Side raise'                    , 'exicons/11.png', 1, 'DB Shoulders',3,  9, 'times', 'Stand straight and slightly bend elbows; slowly upper arms sidewards until head level; hold 1 sec. and return and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (108, 'Chek press'                    , 'exicons/10.png', 1, 'DB Shoulders',3,  9, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (109, 'Front raise'                   , 'exicons/26.png', 1, 'DB Shoulders',3,  9, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (110, 'Seated press'                  , 'exicons/9.png' , 1, 'DB Shoulders',3,  9, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (111, 'Shoulder shrug'                , 'exicons/14.png', 1, 'DB Beg'      ,3, 10, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (114, 'Renegade rows'                 , 'exicons/15.png', 1, 'DB Beg'      ,3,  8, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (104, 'Kickbacks'                     , 'exicons/8.png' , 1, 'DB Triceps'  ,3,  8, 'times', 'Lean with one knee and elbow on table; kickback your arm, return and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (107, 'Triceps extension'             , 'exicons/6.png' , 1, 'DB Triceps'  ,3,  9, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (112, 'One arm press'                 , 'exicons/5.png' , 1, 'DB Triceps'  ,3,  9, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (113, 'French press'                  , 'exicons/7.png' , 1, 'DB Triceps'  ,3,  9, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (115, 'Press on floor'                , 'exicons/25.png', 1, 'DB Chest'    ,3, 12, 'times', '');

SELECT * FROM days;
SELECT * FROM exercises;
SELECT name, sets || ' x ' || reps || ' ' || units, description, category, weight, image FROM exercises;
SELECT d.title, e.category, e.name, e.excelrow from exercises e, days d where e.excelrow = ANY(d.exercises) and e.category in ('30 days') order by d.title, e.excelrow
SELECT excelrow, 'Is a not used exercise in days' from exercises except select distinct unnest(exercises), 'Is a not used exercise in days' FROM days order by 1;
SELECT count(exercises) as aantal, unnest(exercises) as exerciseId from days group by unnest(exercises) order by 1 desc, 2 desc;