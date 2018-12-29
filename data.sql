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

INSERT INTO days (title, description, date, exercises) VALUES ('Day 1', 'Start of the 4 days exercises! [CHEST{5} & TRICEPS{4}]', '2018-12-31', ARRAY[-2,-3,25,26,27,28, 52,401,501,402,57,404,    29,86,5,103,201,46,-30]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 2', 'Almost half way! [BEG{3} & BICEPS{1}]', '2019-1-2'                   , ARRAY[-2,-3,25,26,27,28, 4,105,302,103,84,102,301, 18,6,403,202,44,-40]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 3', 'Half way done! [LEGS{0} & SHOULDERS{2}]', '2019-1-4'                 , ARRAY[-2,-3,25,26,27,28, 34,203,71,201,76,202,67,  30,5,102,404,49,-50]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 4', 'Finish the sequence as a pro! [BICEPS{1} & TRICEPS{4}]', '2019-1-5'  , ARRAY[-2,-3,25,26,27,28, 105,402,103,401,101,403,  19,86,6,201,501,44,-60]);

INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-2, 'Shoulders, Arm 2x and legs'     , 'td_action_img/empty/icon.png'                      , 0, 'WARMING-UP'     , 1,  1, 'min', 'Roll shoulders; Cross arms; Rotate arms; Lift legs');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-3, 'Hips, Wrists and Head'          , 'td_action_img/empty/icon.png'                      , 0, 'WARMING-UP'     , 1,  1, 'min', 'Hips twist; Rotate wrists; Head up/down, side to side and rotate');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-30,'ARMS & KNEES'                   , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'   , 1,  1, 'min', 'Stand straight and stretch arms front, back, top and behind head');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-40,'LEGS & BEG'                     , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'   , 1,  1, 'min', 'In sitting position touch your toes; stretch your beg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-50,'ARMS & LEGS'                    , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'   , 1,  1, 'min', 'Stand straight and stretch arms front, back, top and behind head; In sitting position touch your toes; stretch your beg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-60,'KNEES & BEG'                    , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'   , 1,  1, 'min', 'Stand straight and stretch arms front, back, top and behind head; In sitting position touch your toes; stretch your beg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (4 , 'Bird-dog'                       , 'td_action_img/bird_dog/icon.png'                   , 1, '30 days Beg'    , 1, 50, 'times', 'Sit on knees; knees under your butt; hands under shoulders; Stretch right leg en left arm at the same time; hold 5 sec. and repeat other side');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (5 , 'Bridge'                         , 'td_action_img/bridge/icon.png'                     , 1, '30 days Butt'   , 1, 65, 'sec', 'Lie flat on floor, arms flat side body; lift but and keep back straight; hold the position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (6 , 'Bridge butt'                    , 'td_action_img/butt_bridge/icon.png'                , 1, '30 days Butt'   , 1, 24, 'times', 'Lie flat on floor, arms flat side body; lift but up and down');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (18, 'Donkeykick left/right'          , 'td_action_img/donkey_kick_right/icon.png'          , 1, '30 days Butt'   , 1, 22, 'times', 'Sit on knees; knees under your butt; hands under shoulders; Lift one leg and squeeze butt; go back and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (19, 'Firehydrant left/right'         , 'td_action_img/fire_hydrant_right/icon.png'         , 1, '30 days Butt'   , 1, 12, 'times', 'Sit on knees; knees under your butt; hands under shoulders; Lift leg to the side at 90 degree angle');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (25, 'Jumping jacks'                  , 'td_action_img/jumping_jacks/icon.png'              , 1, 'WARMING-UP'     , 1, 20, 'times', 'Start with your feet together and arms by your sides; jump up with feet apart and hands overhead; return to start and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (26, 'BC Knees to Elbows'             , 'td_action_img/empty/icon.png'                      , 1, 'WARMING-UP'     , 1, 20, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (27, 'BC High Knees'                  , 'td_action_img/empty/icon.png'                      , 1, 'WARMING-UP'     , 1, 20, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (28, 'BC Fake Jump Ropes'             , 'td_action_img/empty/icon.png'                      , 1, 'WARMING-UP'     , 1, 20, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (29, 'Leg lift side left/right'       , 'td_action_img/side_leg_lift_right/icon.png'        , 1, '30 days Butt'   , 1, 16, 'times', 'Lie down on your side with your head rested on your arm; lift upper leg and return to start position; keep leg straight; switch side and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (30, 'Leg circles side left/right'    , 'td_action_img/side_leg_circles_right/icon.png'     , 1, '30 days Butt'   , 1, 16, 'times', 'Lie down on your side with your head rested on your hand; lift upper leg and rotate; keep leg straight; switch side and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (34, '2 x 5kg Lunges'                 , 'td_action_img/lunge/icon.png'                      , 1, '30 days Legs'   , 3, 14, 'times', 'Stand straight, put hands on hips; take step forward and lower body until thigh is parallel with floor. Return and switch to other leg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (44, 'Plank'                          , 'td_action_img/plank/icon.png'                      , 1, '30 days Abs'    , 1, 65, 'sec', 'Lie straight with both forearms supporting body; hold position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (46, 'Plank side left/right'          , 'td_action_img/right_side_plank/icon.png'           , 1, '30 days Abs'    , 1, 70, 'sec', 'Lie on side with forearm supporting body; hold position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (49, 'Plank straight-arms'            , 'td_action_img/straight_arm_plank/icon.png'         , 1, '30 days Abs'    , 1, 80, 'sec', 'Lie straight with both arms stretched supporting body; hold position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (52, 'Push-ups'                       , 'td_action_img/push_up/icon.png'                    , 1, '30 days Chest'  , 3,  0, 'times', 'Lie prone with both arms stretched supporting body; lower body with arms');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (57, 'Push-ups incline'               , 'td_action_img/incline_push_up/icon.png'            , 1, '30 days Chest'  , 3,  0, 'times', 'Lie prone with both arms stretched supporting body on table; lower body with arms');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (67, '2 x 5kg Calf raise'             , 'td_action_img/single_leg_calf_raise_right/icon.png', 1, '30 days Legs'   , 3, 16, 'times', 'Stand with arms against the wall; Put your right foot on your left enkle, then lift your heel up and down; now switch foot and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (71, '2 x 5kg Squats'                 , 'td_action_img/squat/icon.png'                      , 1, '30 days Legs'   , 3, 11, 'times', 'Stand wide and arms stretched forward; lower body till thighs are parallel with floor; return to start position and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (76, '2 x 5kg Squats split left/right', 'td_action_img/split_squat_right/icon.png'          , 1, '30 days Legs'   , 3,  6, 'times', 'Take a big step foreward and keep body straight; lower body and go back up; repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (84, 'Superman'                       , 'td_action_img/superman/icon.png'                   , 1, '30 days Beg'    , 1, 10, 'times', 'Lie on stomach with arms extended straigth overhead; Raise both arms and legs up off the floor; hold for 2 sec. return and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (86, '1 x 2.5kg Triceps with chair'   , 'td_action_img/triceps_dip_on_chair/icon.png'       , 1, '30 days Triceps', 1, 20, 'times', 'Sit on chai and move your hip off the chai with your hands holding the chair edge; Slowly bend and stretch arms to make your body go up and down');

INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (101, '2 x 5kg Curls sitting'           , 'exicons/2.png' , 1, 'DB Biceps'   ,3, 16, 'times', 'Sit on chair; keep elbows close to body and palms towards legs; do not move upper arm; raise hand to shoulder; rotate arm when palms facing to shoulder');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (102, '2 x 5kg Curls standing '         , 'exicons/1.png' , 1, 'DB Biceps'   ,3, 16, 'times', 'Stand straight; keep elbows close to body and palms towards legs; do not move upper arm; raise hand to shoulder; rotate arm when palms facing to shoulder');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (103, '1 x 5kg Curls conc. left/right'  , 'exicons/4.png' , 1, 'DB Biceps'   ,3, 16, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (105, '2 x 5kg Hammer'                  , 'exicons/3.png' , 1, 'DB Biceps'   ,3, 18, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (201, '2 x 5kg Side raise'              , 'exicons/11.png', 1, 'DB Shoulders',3, 11, 'times', 'Stand straight and slightly bend elbows; slowly upper arms sidewards until head level; hold 1 sec. and return and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (202, '2 x 5kg Front raise'             , 'exicons/26.png', 1, 'DB Shoulders',3, 11, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (203, '2 x 5kg Seated press'            , 'exicons/9.png' , 1, 'DB Shoulders',3, 13, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (301, '2 x 5kg Shoulder shrug'          , 'exicons/14.png', 1, 'DB Beg'      ,3, 16, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (302, '2 x 5kg Renegade rows'           , 'exicons/15.png', 1, 'DB Beg'      ,3, 11, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (401, '2 x 5kg Kickbacks'               , 'exicons/8.png' , 1, 'DB Triceps'  ,3,  7, 'times', 'Lean with one knee and elbow on table; kickback your arm, return and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (402, '2 x 5kg Triceps extension'       , 'exicons/6.png' , 1, 'DB Triceps'  ,3, 12, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (403, '1 x 5kg One arm press left/right', 'exicons/5.png' , 1, 'DB Triceps'  ,3, 12, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (404, '2 x 5kg French press'            , 'exicons/7.png' , 1, 'DB Triceps'  ,3, 12, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (501, '2 x 5kg Press on floor'          , 'exicons/25.png', 1, 'DB Chest'    ,3, 18, 'times', '');

SELECT * FROM days;
SELECT * FROM exercises;
SELECT name, sets || ' x ' || reps || ' ' || units, description, category, weight, image FROM exercises;
SELECT d.title, e.category, e.name, e.excelrow from exercises e, days d where e.excelrow = ANY(d.exercises) and e.category in ('30 days') order by d.title, e.excelrow
SELECT excelrow, 'Is a not used exercise in days' from exercises except select distinct unnest(exercises), 'Is a not used exercise in days' FROM days order by 1;
SELECT count(exercises) as aantal, unnest(exercises) as exerciseId from days group by unnest(exercises) order by 1 desc, 2 desc;