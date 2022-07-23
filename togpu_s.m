function [outdata] = togpu_s(indata)
% ������
%   �˴���ʾ��ϸ˵��
if isa(indata, 'cell')
    for ind = 1:length(indata)
        indata{ind} = gpuArray(single(full(indata{ind})));
    end
elseif isa(indata, 'numeric')
    indata = gpuArray(single(full(indata)));
else
    try
        indata = gpuArray(single(full(indata)));
    catch
        causeException = MException('MATLAB:gpuArray type of input data error.');
        throw(causeException)
    end
end
outdata = indata;

