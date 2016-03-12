function [x,y, order] = peano(dSize)
% function [x,y, order] = peano(dSize)
% Fill x,y arrays of length dSize*dSize with the coordinates of each
% pixel, in the order that they are touched by the peano curve
% Fill order matrix of size dSize x dSize with the order in which each pixel is
% hit by a peano curve.
%
% By now, at least, the sizes must be powers of two
%
xSize = dSize;
ySize = dSize;

% code for dir: 1/up, 2/right, 3/down, 4/left; +4 for clockwise
% direction indicates the opening of the "U"

xTmp = 1;
yTmp = 1;
dirTmp = 1; 

% 1 -> 4 1 1 2, 2->1 2 2 3, 3->2 3 3 4, 4->3 4 4 1
% + 4 0 0 4
dirLookup = [4 1 1 2; 1 2 2 3; 2 3 3 4; 3 4 4 1 ; ...
			2 1 1 4; 3 2 2 1; 4 3 3 2; 1 4 4 3]';
dirLookup = dirLookup + [4 0 0 4; 4 0 0 4; 4 0 0 4; 4 0 0 4;...
			0 4 4 0; 0 4 4 0; 0 4 4 0; 0 4 4 0]';

orderLookup = [1 3 4 2; 2 1 3 4; 4 2 1 3; 3 4 2 1; ...
				2 4 3 1; 4 3 1 2; 3 1 2 4; 1 2 4 3]';
offsetLookup = [0 1 0 1; 0 0 1 1];

%for iLoop = 1:(log2(xSize)-1)
for iLoop = 1:(log2(xSize))
	xTmp = [(xTmp-1)*2 + offsetLookup(1,orderLookup(1,dirTmp))+1;...
			(xTmp-1)*2 + offsetLookup(1,orderLookup(2,dirTmp))+1;...
			(xTmp-1)*2 + offsetLookup(1,orderLookup(3,dirTmp))+1;...
			(xTmp-1)*2 + offsetLookup(1,orderLookup(4,dirTmp))+1];
	yTmp = [(yTmp-1)*2 + offsetLookup(2,orderLookup(1,dirTmp))+1;...
			(yTmp-1)*2 + offsetLookup(2,orderLookup(2,dirTmp))+1;...
			(yTmp-1)*2 + offsetLookup(2,orderLookup(3,dirTmp))+1;...
			(yTmp-1)*2 + offsetLookup(2,orderLookup(4,dirTmp))+1];
	dirTmp = [dirLookup(1,dirTmp);dirLookup(2,dirTmp);...
			 dirLookup(3,dirTmp);dirLookup(4,dirTmp)];
	xTmp = xTmp(:)';
	yTmp = yTmp(:)';
%	reshape(dirTmp(:), [4, size(dirTmp(:),1)/4])
	dirTmp = dirTmp(:)';
end
x = xTmp';
y = yTmp';
%if (nargout == 1)
	order = zeros(dSize);
	order((x-1) * ySize + y) = 1:(xSize*ySize);
	order = reshape(order,[dSize dSize]);
%end;
