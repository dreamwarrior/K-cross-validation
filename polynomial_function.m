function polynomial_function()

% x = 0:pi/20:2*pi;

traindata=importdata('traindata.txt');
x=traindata(:,1:8);
y=traindata(:,9);
N=length(x);
K=10;
ErrTrain=[];
ErrTest=[];
meanTestErr=[];
meanTrainErr=[];
for p=0:10
    for k=1:K

        test_start = 1+(k-1)*N/K;
        test_end   = k*N/K;
        %Test data definition
        data_test  = x(test_start:test_end,:)';
        y_test = y(test_start:test_end,:);
        %Train data definition
        data_train = [x(1:test_start-1,:)' x(test_end+1:N,:)'];
        y_train = [y(1:test_start-1,:)' y(test_end+1:N,:)'];
        y_train = y_train';
        
        %z definition with resect to different polynomial
        %z_test definition with resect to different polynomial
        
        z=0;
        z_test=0;
        for j=0:p
            if z==0
                z=data_train.^j;
                z_test=data_test.^j;
            else
                z=[z;data_train.^j];
                z_test=[z_test;data_test.^j];
            end
        end
        fprintf("length of z:\n");
        disp(z);
        %find mean square value w for on training data
        w=z'\y_train;
        y_train_pred = w'*z; 
        
        %get Training Error here and put that into a vector
        ErrTrain=[ErrTrain (norm(y_train_pred'-y_train)^2)];
        
        fprintf("data test for p %f\n",p)
        disp(data_test);
        
        fprintf("z test for p %f\n",p)
        disp(z_test);
        
        fprintf("w test for p %f\n",p)
        disp(w);
        %get Y prediction on test data and Test Error here and put that into a vector
        y_test_pred = z_test'*w;
       
        ErrTest=[ErrTest (norm(y_test_pred'-y_test)^2)];
        
        

    end
    % find mean
    meanTestErr=[meanTestErr sum(ErrTest)/length(ErrTest')];
    meanTrainErr=[meanTrainErr sum(ErrTrain)/length(ErrTrain')];
    
    
end
disp([meanTestErr' meanTrainErr'])


