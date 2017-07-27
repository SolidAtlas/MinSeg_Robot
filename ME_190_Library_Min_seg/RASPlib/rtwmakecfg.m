function makeInfo=rtwmakecfg() 
disp(['Running rtwmakecfg from folder: ',pwd]);
src_dir = mfilename('fullpath');
makeInfo.includePath = {[pwd]};
makeInfo.sourcePath  = {};
makeInfo.linkLibsObjs = {};


