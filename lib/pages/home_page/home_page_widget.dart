import '/backend/schema/structs/index.dart';
import '/dashboard/dashboard/dashboard_widget.dart';
import '/dashboard/final_pitch/final_pitch_widget.dart';
import '/dashboard/skip_dialog/skip_dialog_widget.dart';
import '/email_template/login_component/login_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/footer/footer_button/footer_button_widget.dart';
import '/header/header_with_progress_bar/header_with_progress_bar_widget.dart';
import '/loading_template/loading_screen_before_result/loading_screen_before_result_widget.dart';
import '/loading_template/start_loading_component/start_loading_component_widget.dart';
import '/pitch_body_templates/pitch_body_detailed_text_images/pitch_body_detailed_text_images_widget.dart';
import '/pitch_body_templates/pitch_body_simple_detailed_text_images/pitch_body_simple_detailed_text_images_widget.dart';
import '/pitch_body_templates/pitch_body_simple_text_images_body/pitch_body_simple_text_images_body_widget.dart';
import '/templates/image_background_ques_body/image_background_ques_body_widget.dart';
import '/templates/image_background_ques_body_v3/image_background_ques_body_v3_widget.dart';
import '/templates/multi_choice_with_image_question_check_box/multi_choice_with_image_question_check_box_widget.dart';
import '/templates/question_answer/question_answer_widget.dart';
import '/templates/question_answer_additionl_info/question_answer_additionl_info_widget.dart';
import '/templates/rating_question_options/rating_question_options_widget.dart';
import '/templates/single_choice_question_large_image/single_choice_question_large_image_widget.dart';
import '/templates/single_choice_question_smalllmage/single_choice_question_smalllmage_widget.dart';
import '/templates/titles_and_description_ans_body/titles_and_description_ans_body_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (valueOrDefault<bool>(
                    FFAppState().quizIndex != 0,
                    true,
                  ) &&
                  (FFAppState().quizIndex != 20) &&
                  (FFAppState().quizIndex != 19))
                wrapWithModel(
                  model: _model.headerWithProgressBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: HeaderWithProgressBarWidget(
                    isProgress: (FFAppState().quizIndex != 0) &&
                        (FFAppState().quizIndex != 18) &&
                        (FFAppState().quizIndex != 19) &&
                        (FFAppState().quizIndex != 20),
                    isBack: (FFAppState().quizIndex != 0) &&
                        (FFAppState().quizIndex != 6) &&
                        (FFAppState().quizIndex != 8) &&
                        (FFAppState().quizIndex != 13) &&
                        ((FFAppState().quizIndex != 0) &&
                            (FFAppState().quizIndex != 18) &&
                            (FFAppState().quizIndex != 19) &&
                            (FFAppState().quizIndex != 20)) &&
                        (FFAppState().quizIndex != 7) &&
                        (FFAppState().quizIndex != 9) &&
                        (FFAppState().quizIndex != 17),
                    fillColor: FlutterFlowTheme.of(context).info,
                    totalQuestion: 19,
                    currentQuestion: FFAppState().quizIndex,
                    totalSegments: 5,
                    backAction: () async {
                      await _model.pageViewController?.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    onPageChanged: (_) async {
                      FFAppState().quizIndex = _model.pageViewCurrentIndex;
                      FFAppState().update(() {});
                    },
                    scrollDirection: Axis.horizontal,
                    children: [
                      Builder(
                        builder: (context) => wrapWithModel(
                          model: _model.startGoalImageBackgroundQuesBodyModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ImageBackgroundQuesBodyWidget(
                            question:
                                'See if the Challenge is a fit for you and your hair profile',
                            answer1: '',
                            answer2: '',
                            logoShow: true,
                            image:
                                'https://assets.hairqare.co/sarah-quiz-start-cover.webp',
                            answer3: '',
                            questionId: 'hairGoal',
                            skipAction: () async {
                              await actions.trackGAEvent(
                                'Opened Skip Dialog',
                                '',
                                '',
                                FFAppConstants.nonQuestionAnswerItem.toList(),
                                '',
                                '',
                              );
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: SkipDialogWidget(),
                                    ),
                                  );
                                },
                              );
                            },
                            checkBoxToggleOn: () async {},
                            checkBoxToggleOff: () async {},
                            answerAction1: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .startGoalImageBackgroundQuesBodyModel
                                          .questionId,
                                      answerIds: _model
                                          .startGoalImageBackgroundQuesBodyModel
                                          .selectedAnswerId,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            answerAction2: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .startGoalImageBackgroundQuesBodyModel
                                          .questionId,
                                      answerIds: _model
                                          .startGoalImageBackgroundQuesBodyModel
                                          .selectedAnswerId,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            answerAction3: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .startGoalImageBackgroundQuesBodyModel
                                          .questionId,
                                      answerIds: _model
                                          .startGoalImageBackgroundQuesBodyModel
                                          .selectedAnswerId,
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.typeSingleChoiceQuestionLargeImageModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SingleChoiceQuestionLargeImageWidget(
                          question: 'Which hair type do you have?',
                          answerData: FFAppState().hairType,
                          questionId: '',
                          answerAction: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: valueOrDefault<String>(
                                      _model
                                          .typeSingleChoiceQuestionLargeImageModel
                                          .questionId,
                                      'test',
                                    ),
                                    answerIds: _model
                                        .typeSingleChoiceQuestionLargeImageModel
                                        .selectedAnswer,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.ageSingleChoiceQuestionSmalllmageModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SingleChoiceQuestionSmalllmageWidget(
                          question: 'How old are you?',
                          subQuestion: '',
                          answerList: FFAppState().age,
                          showBeforeQuestionTitle: false,
                          answerAction: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .ageSingleChoiceQuestionSmalllmageModel
                                        .questionId,
                                    answerIds: _model
                                        .ageSingleChoiceQuestionSmalllmageModel
                                        .selectedAnswer,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model:
                            _model.concernSingleChoiceQuestionSmalllmageModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SingleChoiceQuestionSmalllmageWidget(
                          question:
                              'What is your biggest hair concern right now?',
                          subQuestion: ' Select one',
                          answerList: FFAppState().hairConcern,
                          questionId: '',
                          showBeforeQuestionTitle: false,
                          answerAction: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .concernSingleChoiceQuestionSmalllmageModel
                                        .questionId,
                                    answerIds: _model
                                        .concernSingleChoiceQuestionSmalllmageModel
                                        .selectedAnswer,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.routineTitlesAndDescriptionAnsBodyModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TitlesAndDescriptionAnsBodyWidget(
                          question:
                              'What best describes your current haircare routine?',
                          description: '',
                          answerList: FFAppState().currentRoutine,
                          answerAction: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .routineTitlesAndDescriptionAnsBodyModel
                                        .questionId,
                                    answerIds: _model
                                        .routineTitlesAndDescriptionAnsBodyModel
                                        .selectedAnswer,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.damageQuestionAnswerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: QuestionAnswerWidget(
                          question:
                              'Do you already know exactly ${valueOrDefault<String>(
                            () {
                              if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairConcern',
                                    answerIds: ['concern_hairloss'],
                                  ))) {
                                return 'what’s triggering your hair fall or thinning?';
                              } else if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairConcern',
                                    answerIds: ['concern_splitends'],
                                  ))) {
                                return 'how you can tame your frizz and dryness?';
                              } else if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairConcern',
                                    answerIds: ['concern_scalp'],
                                  ))) {
                                return 'what’s behind your scalp irritation or dandruff issues?';
                              } else if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairConcern',
                                    answerIds: ['concern_damage'],
                                  ))) {
                                return 'how you can save your hair from further damage?';
                              } else {
                                return 'what’s causing your hair issues?';
                              }
                            }(),
                            'what’s causing your hair issues?',
                          )}',
                          answerList: FFAppState().knowledgeState,
                          answerAction: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .damageQuestionAnswerModel.questionId,
                                    answerIds: _model.damageQuestionAnswerModel
                                        .selectedAnswer,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.damagePitchBodyTextImagesBodyCopyModel,
                        updateCallback: () => safeSetState(() {}),
                        child: PitchBodySimpleTextImagesBodyWidget(
                          title: 'Don\'t worry! We got you.',
                          navigationTap: () async {
                            await actions.trackGAEvent(
                              'Continued From Pitch',
                              '',
                              'Damage Pitch',
                              FFAppConstants.nonQuestionAnswerItem.toList(),
                              '',
                              '',
                            );
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model
                            .hairqareMethodSingleChoiceQuestionSmalllmageModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SingleChoiceQuestionSmalllmageWidget(
                          question:
                              'How familiar are you with Hairqare and our clean DIY product method?',
                          subQuestion: '',
                          questionId: 'hairqare',
                          showBeforeQuestionTitle: false,
                          answerList: FFAppState().hairqareKnowledge,
                          answerAction: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .hairqareMethodSingleChoiceQuestionSmalllmageModel
                                        .questionId,
                                    answerIds: _model
                                        .hairqareMethodSingleChoiceQuestionSmalllmageModel
                                        .selectedAnswer,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.pitchBodyTextImagesHolisticModel,
                        updateCallback: () => safeSetState(() {}),
                        child: PitchBodyDetailedTextImagesWidget(
                          title:
                              'Beautiful hair needs more than just products.',
                          description:
                              'Our DIY hair product workshops are developed by Sarah Tran, a certified hair loss specialist, along with a team of researchers, formulation scientists, and medical professionals. ',
                          claim:
                              'They are clinically proven to heal your hair quickly and permanently.',
                          valueProp: 'Proven Results for:',
                          value1: 'Any hair concern',
                          value2: 'Any age',
                          value3: 'Any hair type',
                          value4: 'Any hair goal',
                          navigationTap: () async {
                            await actions.trackGAEvent(
                              'Continued From Pitch',
                              '',
                              'Holistic Pitch',
                              FFAppConstants.nonQuestionAnswerItem.toList(),
                              '',
                              '',
                            );
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.dietSingleChoiceQuestionSmalllmageModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SingleChoiceQuestionSmalllmageWidget(
                          question: 'What best describes your diet?',
                          subQuestion: '',
                          answerList: FFAppState().diet,
                          questionId: '',
                          showBeforeQuestionTitle: true,
                          beforeQuestionTitle:
                              'What we eat affects our hair growth and quality.',
                          answerAction: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .dietSingleChoiceQuestionSmalllmageModel
                                        .questionId,
                                    answerIds: _model
                                        .dietSingleChoiceQuestionSmalllmageModel
                                        .selectedAnswer,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.spendQuestionAnswerAdditionlInfoModel,
                        updateCallback: () => safeSetState(() {}),
                        child: QuestionAnswerAdditionlInfoWidget(
                          question:
                              'How much do you spend on a bottle of shampoo?',
                          answerList: FFAppState().shampooSpending,
                          answerAction: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .spendQuestionAnswerAdditionlInfoModel
                                        .questionId,
                                    answerIds: _model
                                        .spendQuestionAnswerAdditionlInfoModel
                                        .answerId,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await actions.trackGAEvent(
                              'Question Answered',
                              _model.spendQuestionAnswerAdditionlInfoModel
                                  .questionId,
                              _model.spendQuestionAnswerAdditionlInfoModel
                                  .question,
                              _model.spendQuestionAnswerAdditionlInfoModel
                                  .answerId
                                  .toList(),
                              '',
                              '',
                            );
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model
                            .mythsMultiChoiceWithImageQuestionCheckBoxModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MultiChoiceWithImageQuestionCheckBoxWidget(
                          question:
                              'Which of these hair care myths do you believe?',
                          answerList: FFAppState().hairMyth,
                          questionId: 'hairMyth',
                          navigationTap: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    answerIds: _model
                                        .mythsMultiChoiceWithImageQuestionCheckBoxModel
                                        .selectedAnswer,
                                    questionId: _model
                                        .mythsMultiChoiceWithImageQuestionCheckBoxModel
                                        .questionId,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model
                            .damagePracticeMultiChoiceWithImageQuestionCheckBoxModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MultiChoiceWithImageQuestionCheckBoxWidget(
                          question:
                              'Select the damaging practices that you regularly do',
                          answerList: FFAppState().hairDamageActivity,
                          questionId: 'hairDamageActivity',
                          navigationTap: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    answerIds: _model
                                        .damagePracticeMultiChoiceWithImageQuestionCheckBoxModel
                                        .selectedAnswer,
                                    questionId: _model
                                        .damagePracticeMultiChoiceWithImageQuestionCheckBoxModel
                                        .questionId,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.pitchBodySimpleDetailedTextImagesModel,
                        updateCallback: () => safeSetState(() {}),
                        child: PitchBodySimpleDetailedTextImagesWidget(
                          description:
                              'With the right routine it\'s fine to ${() {
                            if (() {
                              if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairDamageActivity',
                                    answerIds: ['damageAction_heat'],
                                  ))) {
                                return true;
                              } else if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairDamageActivity',
                                    answerIds: ['damageAction_dye'],
                                  ))) {
                                return true;
                              } else if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairDamageActivity',
                                    answerIds: ['damageAction_hairstyles'],
                                  ))) {
                                return true;
                              } else {
                                return false;
                              }
                            }()) {
                              return 'to style, curl or color your hair. ';
                            } else if (() {
                              if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairDamageActivity',
                                    answerIds: ['damageAction_swimming'],
                                  ))) {
                                return true;
                              } else if (FFAppState()
                                  .quizProfile
                                  .qaPairs
                                  .contains(QuestionAnswerPairStruct(
                                    questionId: 'hairDamageActivity',
                                    answerIds: ['damageAction_sun'],
                                  ))) {
                                return true;
                              } else {
                                return false;
                              }
                            }()) {
                              return 'live an active lifestyle.';
                            } else {
                              return 'style your hair any way you like and do the activities you enjoy.';
                            }
                          }()}',
                          claim: () {
                            if (FFAppState()
                                .quizProfile
                                .qaPairs
                                .contains(QuestionAnswerPairStruct(
                                  questionId: 'currentRoutine',
                                  answerIds: ['routine_complex'],
                                ))) {
                              return 'But if you are still struggling with${() {
                                if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_hairloss'],
                                    ))) {
                                  return ' hair loss and thinning';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_splitends'],
                                    ))) {
                                  return ' split ends and dryness';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_scalp'],
                                    ))) {
                                  return ' dandruff and scalp irritation';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_damage'],
                                    ))) {
                                  return ' damaged hair and breakage';
                                } else {
                                  return ' mixed hair issues';
                                }
                              }()} despite all the treatments, specialists and products you’ve tried, you’re missing important haircare knowledge. ';
                            } else if (FFAppState()
                                .quizProfile
                                .qaPairs
                                .contains(QuestionAnswerPairStruct(
                                  questionId: 'currentRoutine',
                                  answerIds: ['routine_basic'],
                                ))) {
                              return 'But if you are still struggling with${() {
                                if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_hairloss'],
                                    ))) {
                                  return ' hair loss and thinning';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_splitends'],
                                    ))) {
                                  return ' split ends and dryness';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_scalp'],
                                    ))) {
                                  return ' dandruff and scalp irritation';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_damage'],
                                    ))) {
                                  return ' damaged hair and breakage';
                                } else {
                                  return ' mixed hair issues';
                                }
                              }()} while only relying on using shampoo & conditioner, you’re missing important haircare knowledge. ';
                            } else if (FFAppState()
                                .quizProfile
                                .qaPairs
                                .contains(QuestionAnswerPairStruct(
                                  questionId: 'currentRoutine',
                                  answerIds: ['routine_intermediete'],
                                ))) {
                              return 'But if you are still struggling with${() {
                                if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_hairloss'],
                                    ))) {
                                  return ' hair loss and thinning';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_splitends'],
                                    ))) {
                                  return ' split ends and dryness';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_scalp'],
                                    ))) {
                                  return ' dandruff and scalp irritation';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_damage'],
                                    ))) {
                                  return ' damaged hair and breakage';
                                } else {
                                  return ' mixed hair issues';
                                }
                              }()} despite making time for hair masks and other treatments, you’re missing important haircare knowledge. ';
                            } else if (FFAppState()
                                .quizProfile
                                .qaPairs
                                .contains(QuestionAnswerPairStruct(
                                  questionId: 'currentRoutine',
                                  answerIds: ['routine_natural'],
                                ))) {
                              return 'But if you are still struggling with${() {
                                if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_hairloss'],
                                    ))) {
                                  return ' hair loss and thinning';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_splitends'],
                                    ))) {
                                  return ' split ends and dryness';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_scalp'],
                                    ))) {
                                  return ' dandruff and scalp irritation';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_damage'],
                                    ))) {
                                  return ' damaged hair and breakage';
                                } else {
                                  return ' mixed hair issues';
                                }
                              }()} despite using organic products and home remedies, you’re missing important haircare knowledge. ';
                            } else {
                              return 'But if you are still struggling with${() {
                                if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_hairloss'],
                                    ))) {
                                  return ' hair loss and thinning';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_splitends'],
                                    ))) {
                                  return ' split ends and dryness';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_scalp'],
                                    ))) {
                                  return ' dandruff and scalp irritation';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_damage'],
                                    ))) {
                                  return ' damaged hair and breakage';
                                } else {
                                  return ' mixed hair issues';
                                }
                              }()} despite what you’ve already tried, you’re missing important haircare knowledge. ';
                            }
                          }(),
                          valueProp:
                              'Here is what you can achieve in 5 days of following the right routine for your hair:',
                          conclusion: 'That\'s why nothing has worked so far.',
                          navigationTap: () async {
                            await actions.trackGAEvent(
                              'Continued From Pitch',
                              '',
                              'Damage Practices Pitch',
                              FFAppConstants.nonQuestionAnswerItem.toList(),
                              '',
                              '',
                            );
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.mirrorRatingQuestionOptionsModel,
                        updateCallback: () => safeSetState(() {}),
                        child: RatingQuestionOptionsWidget(
                          question:
                              'My reflection in the mirror affects my mood and self-esteem.',
                          subQuestion:
                              'How much do you relate to the following statement?',
                          questionId: 'confidence',
                          buttonAction: () async {
                            await actions.trackGAEvent(
                              'Question Answered',
                              _model
                                  .mirrorRatingQuestionOptionsModel.questionId,
                              _model.mirrorRatingQuestionOptionsModel.question,
                              _model.mirrorRatingQuestionOptionsModel
                                  .selectedAnswer
                                  .toList(),
                              '',
                              '',
                            );
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .mirrorRatingQuestionOptionsModel
                                        .questionId,
                                    answerIds: _model
                                        .mirrorRatingQuestionOptionsModel
                                        .selectedAnswer,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.compareRatingQuestionOptionsModel,
                        updateCallback: () => safeSetState(() {}),
                        child: RatingQuestionOptionsWidget(
                          question:
                              'I tend to compare my hair to others\' and it makes me frustrated.',
                          subQuestion:
                              'How much do you relate to the following statement?',
                          questionId: 'comparison',
                          buttonAction: () async {
                            await actions.trackGAEvent(
                              'Question Answered',
                              _model
                                  .compareRatingQuestionOptionsModel.questionId,
                              _model.compareRatingQuestionOptionsModel.question,
                              _model.compareRatingQuestionOptionsModel
                                  .selectedAnswer
                                  .toList(),
                              '',
                              '',
                            );
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .compareRatingQuestionOptionsModel
                                        .questionId,
                                    answerIds: _model
                                        .compareRatingQuestionOptionsModel
                                        .selectedAnswer,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.professionalQuestionAnswerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: QuestionAnswerWidget(
                          question: 'Did a professional refer you to us?',
                          answerList: FFAppState().professionalReferral,
                          answerAction: () async {
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .professionalQuestionAnswerModel
                                        .questionId,
                                    answerIds: _model
                                        .professionalQuestionAnswerModel
                                        .selectedAnswer,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.loadingScreenBeforeResultModel,
                        updateCallback: () => safeSetState(() {}),
                        child: LoadingScreenBeforeResultWidget(
                          title: 'Creating your personalized haircare program',
                          carouselImageList: FFAppState().imageList,
                          checkPointList: FFAppState().beforeLoadingData,
                          autoNavigation: () async {
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.loginComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: LoginComponentWidget(
                          progressBarValue: 90.0,
                          concernResolutionChance: valueOrDefault<String>(
                            'Probability to fix your ${valueOrDefault<String>(
                              () {
                                if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_hairloss'],
                                    ))) {
                                  return 'hair loss';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_splitends'],
                                    ))) {
                                  return 'split-ends';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_scalp'],
                                    ))) {
                                  return 'scalp issues';
                                } else if (FFAppState()
                                    .quizProfile
                                    .qaPairs
                                    .contains(QuestionAnswerPairStruct(
                                      questionId: 'hairConcern',
                                      answerIds: ['concern_damage'],
                                    ))) {
                                  return 'damaged hair';
                                } else {
                                  return 'hair problems';
                                }
                              }(),
                              'hair problems',
                            )} in 5 days:',
                            'Probability to reduce your hair problems in 14 days',
                          ),
                          submitAction: () async {
                            _model.capitalisedName =
                                await actions.convertToTitleCase(
                              _model.loginComponentModel
                                  .nameTextFieldTextController.text,
                            );
                            FFAppState().updateSubmittedContactDetailsStruct(
                              (e) => e
                                ..name = _model.capitalisedName
                                ..email = _model.loginComponentModel
                                    .emailTextFieldTextController.text,
                            );
                            safeSetState(() {});
                            await actions.webhookCallQuizProfile();
                            await actions.webhookCallcvg();
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );

                            safeSetState(() {});
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.dashboardModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DashboardWidget(
                          name: FFAppState().submittedContactDetails.name,
                          percentage: valueOrDefault<int>(
                            random_data.randomInteger(92, 97),
                            97,
                          ),
                          description: 'ewew',
                          goal: 'test',
                          startDate: getCurrentTimestamp,
                          startMyChallengeAction: () async {
                            FFAppState().showResultPageredirectLoader = true;
                            safeSetState(() {});
                            await actions.trackGAEvent(
                              'Go to  checkout',
                              '',
                              'Result Page',
                              FFAppConstants.nonQuestionAnswerItem.toList(),
                              '',
                              '',
                            );
                            await actions.redirectToCheckout();
                          },
                          reserveMySeatAction: () async {
                            FFAppState().showResultPageredirectLoader = true;
                            safeSetState(() {});
                            await actions.trackGAEvent(
                              'Go to  checkout',
                              '',
                              'Result Page',
                              FFAppConstants.nonQuestionAnswerItem.toList(),
                              '',
                              '',
                            );
                            await actions.redirectToCheckout();
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.finalPitchModel,
                        updateCallback: () => safeSetState(() {}),
                        child: FinalPitchWidget(
                          previousDiscountPercentage: 30,
                          discountPercentage: 85,
                        ),
                      ),
                      Visibility(
                        visible: responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ),
                        child: wrapWithModel(
                          model: _model.startLoadingComponentModel,
                          updateCallback: () => safeSetState(() {}),
                          child: StartLoadingComponentWidget(
                            navigation: () async {
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.holisticQuestionAnswerAdditionlInfoModel,
                        updateCallback: () => safeSetState(() {}),
                        child: QuestionAnswerAdditionlInfoWidget(
                          question:
                              'Do you believe your hair problems could be influenced by factors beyond just products?',
                          answerList: FFAppState().mindsetState,
                          answerAction: () async {
                            await actions.trackGAEvent(
                              'Question Answered',
                              _model.holisticQuestionAnswerAdditionlInfoModel
                                  .questionId,
                              _model.holisticQuestionAnswerAdditionlInfoModel
                                  .question,
                              _model.holisticQuestionAnswerAdditionlInfoModel
                                  .answerId
                                  .toList(),
                              '',
                              '',
                            );
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                            FFAppState().updateQuizProfileStruct(
                              (e) => e
                                ..updateQaPairs(
                                  (e) => e.add(QuestionAnswerPairStruct(
                                    questionId: _model
                                        .holisticQuestionAnswerAdditionlInfoModel
                                        .questionId,
                                    answerIds: _model
                                        .holisticQuestionAnswerAdditionlInfoModel
                                        .answerId,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                          },
                        ),
                      ),
                      Builder(
                        builder: (context) => wrapWithModel(
                          model: _model.goalImageBackgroundQuesBodyV3Model,
                          updateCallback: () => safeSetState(() {}),
                          child: ImageBackgroundQuesBodyV3Widget(
                            question:
                                'See if the Challenge is a fit for you and your hair profile',
                            answer1: '',
                            answer2: '',
                            logoShow: true,
                            answerImage1: '',
                            answerImage2: '',
                            answer3: '',
                            questionId: 'hairGoal',
                            aswerImage3:
                                'https://cdn.prod.website-files.com/62cbaa353a301eb715aa33d0/62cbaa353a301e2df7aa36c9_sarah-tran-holiniq-hairqare-2.webp',
                            answerList: FFAppState().hairGoal,
                            skipAction: () async {
                              await actions.trackGAEvent(
                                'Opened Skip Dialog',
                                '',
                                '',
                                FFAppConstants.nonQuestionAnswerItem.toList(),
                                '',
                                '',
                              );
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: SkipDialogWidget(),
                                    ),
                                  );
                                },
                              );
                            },
                            checkBoxToggleOn: () async {},
                            checkBoxToggleOff: () async {},
                            answerAction1: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .goalImageBackgroundQuesBodyV3Model
                                          .questionId,
                                      answerIds: ['goal_hairloss'],
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            answerAction2: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .goalImageBackgroundQuesBodyV3Model
                                          .questionId,
                                      answerIds: ['goal_betterhair'],
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            answerAction3: () async {
                              FFAppState().updateQuizProfileStruct(
                                (e) => e
                                  ..updateQaPairs(
                                    (e) => e.add(QuestionAnswerPairStruct(
                                      questionId: _model
                                          .goalImageBackgroundQuesBodyV3Model
                                          .questionId,
                                      answerIds: ['goal_both'],
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                              await _model.pageViewController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if ((FFAppState().quizIndex == null) ||
                  (FFAppState().quizIndex < 0))
                wrapWithModel(
                  model: _model.footerButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: FooterButtonWidget(
                    buttonOnTap: () async {
                      await _model.pageViewController?.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Opacity(
                  opacity: 0.0,
                  child: Text(
                    '🤓 🫧 🧖‍♀️ 🌿🤷‍♀️🙌😢😥🔒🔐😌☺️🤗',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 1.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
