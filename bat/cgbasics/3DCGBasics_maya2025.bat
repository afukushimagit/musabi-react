rem 3DCG基礎 maya Windows用起動バッチファイル
rem このファイルをmayaフォルダの中に入れてください．
rem mayaは毎回このバッチファイルから起動してください．
rem そうしないと，このmayaフォルダ内の環境設定とプロジェクト設定が反映されません．

@echo off

rem 3DCG基礎用mayaフォルダのパス
set THREEDCGBASICS_MAYA_APP_DIR_RAW=%~dp0
set THREEDCGBASICS_MAYA_APP_DIR=%THREEDCGBASICS_MAYA_APP_DIR_RAW:~0,-1%

echo %THREEDCGBASICS_MAYA_APP_DIR%

rem maya dir
set MAYA_APP_DIR=%THREEDCGBASICS_MAYA_APP_DIR%
echo %MAYA_APP_DIR%

rem デフォルトのプロジェクトルート
set MAYA_PROJECTS_DIR=%MAYA_APP_DIR%\projects
echo %MAYA_PROJECTS_DIR%

rem デフォルトのプロジェクト
set MAYA_PROJECT=%MAYA_PROJECTS_DIR%\3DCGBasics
echo %MAYA_PROJECT%

rem Maya実行
pushd "C:\Program Files\Autodesk\Maya2025\bin"
start maya.exe"
popd