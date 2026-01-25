clc;
clear;
close all;

% Initialize the structure matrix
structure = zeros(3, 9);

% Ensure no column is empty
for c = 1:9
    r = randi(3);      % random row (1–3)
    structure(r, c) = 1;
end

% Ensure each row has exactly 5 ones
for r = 1:3
    while sum(structure(r, :)) < 5
        c = randi(9);
        if structure(r, c) == 0
            % Ensure column won't exceed 3 entries
            if sum(structure(:, c)) < 3
                structure(r, c) = 1;
            end
        end
    end
end

disp('Tambola Structure (structure):');
disp(structure);

% Create the final ticket
final_ticket = zeros(3, 9);

for col_idx = 1:9
    % Column ranges
    if col_idx == 1
        range_start = 1;   
        range_end = 9;
    elseif col_idx == 9
        range_start = 80;  
        range_end = 90;
    else
        range_start = (col_idx - 1) * 10;
        range_end = range_start + 9;
    end
    
    % Count numbers in this column
    count = sum(structure(:, col_idx));
    
    % Generate unique numbers
    values = range_start:range_end;
    values = values(randperm(length(values)));
    values = values(1:count);
    
    % Manual ascending sort
    for x = 1:count
        for y = 1:count - x
            if values(y) > values(y + 1)
                swap = values(y);
                values(y) = values(y + 1);
                values(y + 1) = swap;
            end
        end
    end
    
    % Assign top to bottom
    idx = 1;
    for row_idx = 1:3
        if structure(row_idx, col_idx) == 1
            final_ticket(row_idx, col_idx) = values(idx);
            idx = idx + 1;
        end
    end
end

disp('Final Tambola Ticket:');
disp(final_ticket);