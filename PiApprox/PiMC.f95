program name
	implicit none
	
	integer, parameter :: n = 1E8

	integer :: i, pts_in, pts_out
	double precision :: x(1:n), y(1:n), t1, t2
	double precision :: x2, y2

	call cpu_time(t1)

	call random_number(x)
	call random_number(y)

	do i = 1, n
		
		if (x(i)**2 + y(i)**2 < 1) then
			pts_in = pts_in + 1
		else
			pts_out = pts_out + 1
		end if
	end do

	call cpu_time(t2)

	write(*,*) "Generating random numbers once: "
	write(*,*) "pi = ", 4.0 * pts_in / n
	write(*,*) "time = ", t2 - t1
	write(*,*) 

	pts_in = 0
	pts_out = 0

	call cpu_time(t1)
	do i = 1, n
		call random_number(x2)
		call random_number(y2)

		if (x2**2 + y2**2 < 1) then
			pts_in = pts_in + 1
		else
			pts_out = pts_out + 1
		end if
	end do 
	call cpu_time(t2)

	write(*,*) "Generating random numbers in a loop: "
	write(*,*) "pi = ", 4.0 * pts_in / n
	write(*,*) "time = ", t2 - t1

end program name