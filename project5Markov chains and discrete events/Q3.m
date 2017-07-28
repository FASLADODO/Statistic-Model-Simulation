clc;clear
r=0.25
x=0;mean_buffer_temp=0;mean_buffer_temp2=0;
for p=0:0.01:1
buffer=[0,0];%initial 
out=[0,0];n=100000;sum_out=0;
    for i=1:n
    u1=rand();u2=rand();
        if(u1<p)    
            buffer(1)=buffer(1)+1;
        end

        if(u2<p)
            buffer(2)=buffer(2)+1;
        end

    u3=rand();%the propability for input 1 to out 1, and input to out 2 is 1-u3
    u4=rand();%the probaility for input 2 to out 1, and input to out 2 is 1-u4
    if(buffer(1)~=0)
        if(u3<r)
            out(1)=out(1)+1;
        else
            out(2)=out(2)+1;
        end
        buffer(1)=buffer(1)-1;
    end

    if(buffer(2)~=0)
        if(u4<r)
            out(1)=out(1)+1;
        else
            out(2)=out(2)+1;
        end
        buffer(2)=buffer(2)-1;
    end

    %mean of per slot
        if(out(1)==1&&out(2)==1)%1+1
            sum_out=sum_out+2;
        elseif(out(1)==0&&out(2)==0)
            sum_out;
        else
            sum_out=sum_out+1;
        end

        %%collision!
        if(out(1)==2)%detect collision in out1
            u5=rand();%randomly choose one to send
            if(u5<1/2)
                buffer(1)=buffer(1)+1;
            else
                buffer(2)=buffer(2)+1;
            end
               out(1)=out(1)-1;
        end

        if(out(2)==2)%detect collision in out1
            u6=rand();%randomly choose one to send
            if(u6<1/2)
                buffer(1)=buffer(1)+1;
            else
                buffer(2)=buffer(2)+1;
            end
            out(2)=out(2)-1;
        end
    out=[0,0];
    mean_buffer_temp=mean_buffer_temp+buffer(1);
    mean_buffer_temp2=mean_buffer_temp2+buffer(2);
    end
x=x+1;
mean_buffer(x)=mean_buffer_temp/n;
mean_buffer2(x)=mean_buffer_temp2/n;
mean_buffer_temp=0;
mean_buffer_temp2=0
mean_out(x)=sum_out/n;
end
figure(1)
semilogy(0:0.01:1,mean_buffer)
    title('mena of the number of packet1 with p');
    xlabel('p');
    ylabel('Mean of the number of peckets in buffer1');
    figure(2)
semilogy(0:0.01:1,mean_buffer2)
    title('mena of the number of packet2 with p');
    xlabel('p');
    ylabel('Mean of the number of peckets in buffer2');
figure(3)
plot(0:0.01:1,mean_out)
    title('mean of the number of packets processed by the switch per time slot');
    xlabel('p');
    ylabel('mean of the number of packets processed by the switch per time slot');