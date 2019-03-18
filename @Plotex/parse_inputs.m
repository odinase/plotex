function [varargout] = parse_inputs(varargin)

    for i = 1:3:length(varargin)
               
         assert(isnumeric(varargin{i}), 'Two first inputs of data must be vector with numbers');
         assert(isnumeric(varargin{i+1}), 'Two first inputs of data must be vector with numbers');
         assert(length(varargin{i}) == length(varargin{i+1}), 'Two first inputs of data must be of equal length');
         assert(Data.valid_label(varargin{i+2}), 'Last input of triple must be valid legend.');
        
    end

end

