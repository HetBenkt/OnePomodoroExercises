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
-- WARMING-UP, Biceps, Shoulders, Calves, Chest, Back, Triceps, Quadri, Hamstr, Shoulders, Biceps2, Triceps2, Abs, Abs2, COOLING-DOWN
INSERT INTO days (title, description, date, exercises) VALUES ('Day 1', 'Start of the 3 days FULL-BODY exercises!', '2019-6-3', ARRAY[-2,-3,26,  105,  203,  67,   52,    4,301,  34,   5,  19,  201,  102,  401,  41,  46,  -30]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 2', 'Almost half way!', '2019-6-5'                        , ARRAY[-2,-3,28,  102,  201,  69,  501,  302, 86,  71,   6,  29,  202,  103,  403,  42,  44,  -40]);
INSERT INTO days (title, description, date, exercises) VALUES ('Day 3', 'Finish the sequence as a pro!', '2019-6-7'           , ARRAY[-2,-3,25,  103,  202,  68,  502,   84, 86,  76,  18,  30,  203,  105,  404,  43,  49,  -50]);

INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-2, 'Shoulders, Arm 2x and legs'     , 'td_action_img/empty/icon.png'                      , 0, 'WARMING-UP'        , 1,  1, 'min', 'Roll shoulders; Cross arms; Rotate arms; Lift legs');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-3, 'Torso, Hips, Wrists and Head'   , 'td_action_img/empty/icon.png'                      , 0, 'WARMING-UP'        , 1,  1, 'min', 'Rotate torso; Hips twist; Rotate wrists; Head up/down, side to side and rotate');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-30,'ARMS & KNEES & BACK'            , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'      , 1,  1, 'min', 'Stand straight and stretch arms front, back, top and behind head');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-40,'ARMS & LEGS & BACK'             , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'      , 1,  1, 'min', 'In sitting position touch your toes; stretch your beg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (-50,'ARMS & LEGS & KNEES'            , 'td_action_img/empty/icon.png'                      , 0, 'COOLING-DOWN'      , 1,  1, 'min', 'Stand straight and stretch arms front, back, top and behind head; In sitting position touch your toes; stretch your beg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES ( 4, 'Bird-dog'                       , 'td_action_img/bird_dog/icon.png'                   , 1, '30 days Back'      , 1, 30, 'times', 'Sit on knees; knees under your butt; hands under shoulders; Stretch right leg en left arm at the same time; hold 5 sec. and repeat other side');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES ( 5, 'Bridge'                         , 'td_action_img/bridge/icon.png'                     , 1, '30 days Hamstr.'   , 1, 60, 'sec', 'Lie flat on floor, arms flat side body; lift but and keep back straight; hold the position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES ( 6, 'Bridge butt'                    , 'td_action_img/butt_bridge/icon.png'                , 1, '30 days Hamstr.'   , 1, 20, 'times', 'Lie flat on floor, arms flat side body; lift but up and down');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (18, 'Donkeykick left/right'          , 'td_action_img/donkey_kick_right/icon.png'          , 1, '30 days Hamstr.'   , 1, 15, 'times', 'Sit on knees; knees under your butt; hands under shoulders; Lift one leg and squeeze butt; go back and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (19, 'Firehydrant left/right'         , 'td_action_img/fire_hydrant_right/icon.png'         , 1, '30 days Butt'      , 1, 12, 'times', 'Sit on knees; knees under your butt; hands under shoulders; Lift leg to the side at 90 degree angle');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (25, 'Jumping jacks'                  , 'td_action_img/jumping_jacks/icon.png'              , 1, 'WARMING-UP'        , 1, 30, 'times', 'Start with your feet together and arms by your sides; jump up with feet apart and hands overhead; return to start and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (26, 'BC Knees to Elbows'             , 'td_action_img/empty/icon.png'                      , 1, 'WARMING-UP'        , 1, 20, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (28, 'BC Fake Jump Ropes'             , 'td_action_img/empty/icon.png'                      , 1, 'WARMING-UP'        , 1, 20, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (29, 'Leg lift side left/right'       , 'td_action_img/side_leg_lift_right/icon.png'        , 1, '30 days Butt'      , 1, 15, 'times', 'Lie down on your side with your head rested on your arm; lift upper leg and return to start position; keep leg straight; switch side and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (30, 'Leg circles side left/right'    , 'td_action_img/side_leg_circles_right/icon.png'     , 1, '30 days Butt'      , 1, 15, 'times', 'Lie down on your side with your head rested on your hand; lift upper leg and rotate; keep leg straight; switch side and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (34, '2 x 8,5kg Lunges'               , 'td_action_img/lunge/icon.png'                      , 1, '30 days Quadri.'   , 3, 11, 'times', 'Stand straight, put hands on hips; take step forward and lower body until thigh is parallel with floor. Return and switch to other leg');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (41, 'Sit-ups'                        , 'td_action_img/empty/icon.png'                      , 1, '30 days Abs'       , 3, 12, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (42, 'Crunches reversed'              , 'td_action_img/empty/icon.png'                      , 1, '30 days Abs'       , 3, 10, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (43, '1 x 11kg Side Bends left/right' , 'td_action_img/empty/icon.png'                      , 1, '30 days Abs'       , 3, 12, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (44, 'Plank'                          , 'td_action_img/plank/icon.png'                      , 1, '30 days Abs'       , 2, 40, 'sec', 'Lie straight with both forearms supporting body; hold position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (46, 'Plank side left/right'          , 'td_action_img/right_side_plank/icon.png'           , 1, '30 days Abs'       , 1, 40, 'sec', 'Lie on side with forearm supporting body; hold position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (49, 'Plank straight-arms'            , 'td_action_img/straight_arm_plank/icon.png'         , 1, '30 days Abs'       , 1, 90, 'sec', 'Lie straight with both arms stretched supporting body; hold position');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (52, 'Push-ups'                       , 'td_action_img/push_up/icon.png'                    , 1, '30 days Chest'     , 3, 10, 'times', 'Lie prone with both arms stretched supporting body; lower body with arms');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (67, '2 x 8,5kg Calf raise'           , 'td_action_img/single_leg_calf_raise_right/icon.png', 1, '30 days Calves'    , 3, 12, 'times', 'Stand with arms against the wall; Put your right foot on your left enkle, then lift your heel up and down; now switch foot and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (68, '2 x 10kg Calf raise seated'     , 'td_action_img/single_leg_calf_raise_right/icon.png', 1, '30 days Calves'    , 3, 14, 'times', 'Stand with arms against the wall; Put your right foot on your left enkle, then lift your heel up and down; now switch foot and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (69, 'Calf raise left/right'          , 'td_action_img/single_leg_calf_raise_right/icon.png', 1, '30 days Calves'    , 3, 10, 'times', 'Stand with arms against the wall; Put your right foot on your left enkle, then lift your heel up and down; now switch foot and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (71, '2 x 8,5kg Squats'               , 'td_action_img/squat/icon.png'                      , 1, '30 days Quadri.'   , 3, 10, 'times', 'Stand wide and arms stretched forward; lower body till thighs are parallel with floor; return to start position and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (76, '2 x 7kg Squats split left/right', 'td_action_img/split_squat_right/icon.png'          , 1, '30 days Quadri.'   , 3, 12, 'times', 'Take a big step forward and keep body straight; lower body and go back up; repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (84, 'Superman'                       , 'td_action_img/superman/icon.png'                   , 1, '30 days Back'      , 1,  8, 'times', 'Lie on stomach with arms extended straigth overhead; Raise both arms and legs up off the floor; hold for 2 sec. return and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (86, '1 x 7kg Triceps with chair'     , 'td_action_img/triceps_dip_on_chair/icon.png'       , 1, '30 days Triceps'   , 1, 18, 'times', 'Sit on chair and move your hip off the chai with your hands holding the chair edge; Slowly bend and stretch arms to make your body go up and down');

INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (102, '2 x 8,5kg Curls standing'        , 'exicons/1.png'                , 1, 'DB Biceps'   ,3, 12, 'times', 'Stand straight; keep elbows close to body and palms towards legs; do not move upper arm; raise hand to shoulder; rotate arm when palms facing to shoulder');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (103, '1 x 10kg Curls conc. left/right' , 'exicons/4.png'                , 1, 'DB Biceps'   ,3, 10, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (105, '2 x 8,5kg Hammer'                , 'exicons/3.png'                , 1, 'DB Biceps'   ,3, 12, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (201, '2 x 7kg Side raise'              , 'exicons/11.png'               , 1, 'DB Shoulders',3,  9, 'times', 'Stand straight and slightly bend elbows; slowly upper arms sidewards until head level; hold 1 sec. and return and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (202, '2 x 7kg Front raise'             , 'exicons/26.png'               , 1, 'DB Shoulders',3, 11, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (203, '2 x 8,5kg Seated press'          , 'exicons/9.png'                , 1, 'DB Shoulders',3, 10, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (301, '2 x 8,5kg Shoulder shrug'        , 'exicons/14.png'               , 1, 'DB Back'     ,3, 10, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (302, '2 x 7kg Dumbbell rows'           , 'exicons/15.png'               , 1, 'DB Back'     ,3, 10, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (401, '1 x 7kg Kickbacks left/right'    , 'exicons/8.png'                , 1, 'DB Triceps'  ,3,  8, 'times', 'Lean with one knee and elbow on table; kickback your arm, return and repeat');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (403, '1 x 7kg One arm press left/right', 'exicons/5.png'                , 1, 'DB Triceps'  ,3, 11, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (404, '2 x 7kg French press'            , 'exicons/7.png'                , 1, 'DB Triceps'  ,3, 10, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (501, '2 x 8,5kg Press on floor'        , 'exicons/25.png'               , 1, 'DB Chest'    ,3, 12, 'times', '');
INSERT INTO exercises (excelrow, name, image, weight, category, sets, reps, units, description) VALUES (502, '1 x 11kg Dumbbell pullover'      , 'exicons/7.png'                , 1, 'DB Chest'    ,3, 14, 'times', '');

SELECT * FROM days;
SELECT * FROM exercises;
SELECT name, sets || ' x ' || reps || ' ' || units, description, category, weight, image FROM exercises;
SELECT d.title, e.category, e.name, e.excelrow from exercises e, days d where e.excelrow = ANY(d.exercises) and e.category like ('30 days%') order by d.title, e.excelrow;
SELECT excelrow, 'Is a not used exercise in days' from exercises except select distinct unnest(exercises), 'Is a not used exercise in days' FROM days order by 1;
SELECT count(exercises) as aantal, unnest(exercises) as exerciseId from days group by unnest(exercises) order by 1 desc, 2 desc;