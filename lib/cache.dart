//String testData = '''<?xml version="1.0" encoding="utf-8"?>
//<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
//  <soap:Body>
//    <ProcessWebServiceRequestResponse xmlns="http://edupoint.com/webservices/">
//      <ProcessWebServiceRequestResult>
//        <Gradebook xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Type="Traditional" ErrorMessage="" HideStandardGraphInd="false" HideMarksColumnElementary="false" HidePointsColumnElementary="false" HidePercentSecondary="false" DisplayStandardsData="false" GBStandardsTabDefault="false">
//          <ReportingPeriods>
//            <ReportPeriod Index="0" GradePeriod="MP1 Interim" StartDate="8/31/2020" EndDate="10/2/2020"/>
//            <ReportPeriod Index="1" GradePeriod="MP1" StartDate="8/31/2020" EndDate="11/6/2020"/>
//            <ReportPeriod Index="2" GradePeriod="MP2 Interim" StartDate="10/5/2020" EndDate="12/15/2020"/>
//            <ReportPeriod Index="3" GradePeriod="MP2" StartDate="11/10/2020" EndDate="1/28/2021"/>
//            <ReportPeriod Index="4" GradePeriod="MP3 Interim" StartDate="12/16/2020" EndDate="3/12/2021"/>
//            <ReportPeriod Index="5" GradePeriod="MP3" StartDate="2/1/2021" EndDate="4/15/2021"/>
//            <ReportPeriod Index="6" GradePeriod="MP4 Interim" StartDate="3/15/2021" EndDate="5/12/2021"/>
//            <ReportPeriod Index="7" GradePeriod="MP4 S" StartDate="4/19/2021" EndDate="6/16/2021"/>
//          </ReportingPeriods>
//          <ReportingPeriod GradePeriod="MP1 Interim" StartDate="8/31/2020" EndDate="10/2/2020"/>
//          <Courses>
//            <Course Period="1" Title="AP Statistics A (MAT2068A)" Room="134" Staff="Douglas Szafran" StaffEMail="Douglas_M_Szafran@mcpsmd.org" StaffGU="E4EED063-08AB-41B0-BCE9-6C3B0C7AC701" HighlightPercentageCutOffForProgressBar="50">
//              <Marks>
//                <Mark MarkName="MP1 Interim" CalculatedScoreString="N/A" CalculatedScoreRaw="0.00">
//                  <StandardViews/>
//                  <GradeCalculationSummary>
//                    <AssignmentGradeCalc Type="TOTAL" Weight="100%" Points="0.00" PointsPossible="0.00" WeightedPct="100.00%" CalculatedMark="N/A"/>
//                    <AssignmentGradeCalc Type="All Tasks / Assessments" Weight="90%" Points="0.00" PointsPossible="0.00" WeightedPct="0.00%" CalculatedMark="0"/>
//                    <AssignmentGradeCalc Type="Practice / Preparation" Weight="10%" Points="0.00" PointsPossible="0.00" WeightedPct="0.00%" CalculatedMark="0"/>
//                  </GradeCalculationSummary>
//                  <Assignments/>
//                </Mark>
//              </Marks>
//            </Course>
//            <Course Period="2" Title="AP AB Calculus A (MAT2040A)" Room="118" Staff="Stacey Fisher" StaffEMail="Stacey_B_Fisher@mcpsmd.org" StaffGU="AAF78E17-591F-4CEC-9236-BD625877F60D" HighlightPercentageCutOffForProgressBar="50">
//              <Marks>
//                <Mark MarkName="MP1 Interim" CalculatedScoreString="N/A" CalculatedScoreRaw="0.00">
//                  <StandardViews/>
//                  <GradeCalculationSummary/>
//                  <Assignments/>
//                </Mark>
//              </Marks>
//            </Course>
//            <Course Period="3" Title="AP Physics C ElecMagnet A (SCI2063A)" Room="242" Staff="Scott Hanna" StaffEMail="Scott_Hanna@mcpsmd.org" StaffGU="80D8A40E-E730-4C0B-80CE-411CCE00DBCA" HighlightPercentageCutOffForProgressBar="50">
//              <Marks>
//                <Mark MarkName="MP1 Interim" CalculatedScoreString="N/A" CalculatedScoreRaw="0.00">
//                  <StandardViews/>
//                  <GradeCalculationSummary/>
//                  <Assignments/>
//                </Mark>
//              </Marks>
//            </Course>
//            <Course Period="4" Title="AP Language and Comp A (ENG2031A)" Room="220" Staff="Jennifer Miller" StaffEMail="Jennifer_E_MILLER@mcpsmd.org" StaffGU="F69FB8ED-0553-4EFD-87A4-6283408D534C" HighlightPercentageCutOffForProgressBar="50">
//              <Marks>
//                <Mark MarkName="MP1 Interim" CalculatedScoreString="N/A" CalculatedScoreRaw="0.00">
//                  <StandardViews/>
//                  <GradeCalculationSummary>
//                    <AssignmentGradeCalc Type="TOTAL" Weight="100%" Points="0.00" PointsPossible="0.00" WeightedPct="100.00%" CalculatedMark="N/A"/>
//                    <AssignmentGradeCalc Type="All Tasks / Assessments" Weight="90%" Points="0.00" PointsPossible="0.00" WeightedPct="0.00%" CalculatedMark="0"/>
//                    <AssignmentGradeCalc Type="Practice / Preparation" Weight="10%" Points="0.00" PointsPossible="0.00" WeightedPct="0.00%" CalculatedMark="0"/>
//                  </GradeCalculationSummary>
//                  <Assignments/>
//                </Mark>
//              </Marks>
//            </Course>
//            <Course Period="6" Title="Hon Modern World A (SOC2007A)" Room="207" Staff="Karen Arthur" StaffEMail="Karen_L_Arthur@mcpsmd.org" StaffGU="BF483FE6-4BB1-4369-8CEA-8463054835F1" HighlightPercentageCutOffForProgressBar="50">
//              <Marks>
//                <Mark MarkName="MP1 Interim" CalculatedScoreString="100" CalculatedScoreRaw="100.00">
//                  <StandardViews/>
//                  <GradeCalculationSummary>
//                    <AssignmentGradeCalc Type="All Tasks / Assessments" Weight="90%" Points="10.00" PointsPossible="10.00" WeightedPct="90.00%" CalculatedMark="100"/>
//                    <AssignmentGradeCalc Type="TOTAL" Weight="100%" Points="10.00" PointsPossible="10.00" WeightedPct="100.00%" CalculatedMark="100"/>
//                    <AssignmentGradeCalc Type="Practice / Preparation" Weight="10%" Points="0.00" PointsPossible="0.00" WeightedPct="0.00%" CalculatedMark="0"/>
//                  </GradeCalculationSummary>
//                  <Assignments>
//                    <Assignment GradebookID="8952" Measure="Getting to Know You Slideshow" Type="All Tasks / Assessments" Date="8/31/2020" DueDate="9/4/2020" Score="10 out of 10.0000" ScoreType="Raw Score" Points="10.00 / 10.0000" Notes="" TeacherID="8934" StudentID="411837" MeasureDescription="" HasDropBox="false" DropStartDate="9/2/2020" DropEndDate="9/3/2020">
//                      <Resources/>
//                      <Standards/>
//                    </Assignment>
//                  </Assignments>
//                </Mark>
//              </Marks>
//            </Course>
//            <Course Period="7" Title="AP Environmental Sci A (SCI2046A)" Room="130B" Staff="Catherine Trouteaud" StaffEMail="Catherine_B_Trouteaud@mcpsmd.org" StaffGU="9121E006-E16B-490E-B91D-1BBEDF3222E0" HighlightPercentageCutOffForProgressBar="50">
//              <Marks>
//                <Mark MarkName="MP1 Interim" CalculatedScoreString="N/A" CalculatedScoreRaw="0.00">
//                  <StandardViews/>
//                  <GradeCalculationSummary>
//                    <AssignmentGradeCalc Type="TOTAL" Weight="100%" Points="0.00" PointsPossible="0.00" WeightedPct="100.00%" CalculatedMark="N/A"/>
//                    <AssignmentGradeCalc Type="All Tasks / Assessments" Weight="90%" Points="0.00" PointsPossible="0.00" WeightedPct="0.00%" CalculatedMark="0"/>
//                    <AssignmentGradeCalc Type="Practice / Preparation" Weight="10%" Points="0.00" PointsPossible="0.00" WeightedPct="0.00%" CalculatedMark="0"/>
//                  </GradeCalculationSummary>
//                  <Assignments/>
//                </Mark>
//              </Marks>
//            </Course>
//            <Course Period="8" Title="Anatomy and Physiology A (SCI2060A)" Room="145" Staff="James Fishman" StaffEMail="James_R_Fishman@mcpsmd.org" StaffGU="BD7EF872-C010-4634-8242-7A0352B108AB" HighlightPercentageCutOffForProgressBar="50">
//              <Marks>
//                <Mark MarkName="MP1 Interim" CalculatedScoreString="N/A" CalculatedScoreRaw="0.00">
//                  <StandardViews/>
//                  <GradeCalculationSummary>
//                    <AssignmentGradeCalc Type="TOTAL" Weight="100%" Points="0.00" PointsPossible="0.00" WeightedPct="100.00%" CalculatedMark="N/A"/>
//                    <AssignmentGradeCalc Type="All Tasks / Assessments" Weight="90%" Points="0.00" PointsPossible="0.00" WeightedPct="0.00%" CalculatedMark="0"/>
//                    <AssignmentGradeCalc Type="Practice / Preparation" Weight="10%" Points="0.00" PointsPossible="0.00" WeightedPct="0.00%" CalculatedMark="0"/>
//                  </GradeCalculationSummary>
//                  <Assignments>
//                    <Assignment GradebookID="8650" Measure=" FA-Atmospheric Pressure Article questions" Type="All Tasks / Assessments" Date="9/4/2020" DueDate="9/4/2020" Score="Not Graded" ScoreType="Raw Score" Points="2.0000 Points Possible" Notes="" TeacherID="10026" StudentID="411837" MeasureDescription="&lt;link rel=&quot;stylesheet&quot; href=&quot;https://instructure-uploads.s3.amazonaws.com/account_28730000000000001/attachments/137306/canvas_global_app.css&quot;&gt;&lt;p&gt;Read this short article and answer the questions. Submit when done...&lt;/p&gt;&lt;script src=&quot;https://instructure-uploads.s3.amazonaws.com/account_28730000000000001/attachments/137305/canvas_global_app.js&quot;&gt;&lt;/script&gt;" HasDropBox="false" DropStartDate="1/1/1900" DropEndDate="1/1/1900">
//                      <Resources/>
//                      <Standards/>
//                    </Assignment>
//                  </Assignments>
//                </Mark>
//              </Marks>
//            </Course>
//          </Courses>
//        </Gradebook>
//      </ProcessWebServiceRequestResult>
//    </ProcessWebServiceRequestResponse>
//  </soap:Body>
//</soap:Envelope>
//''';