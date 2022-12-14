program name
	implicit none
	
	integer, parameter :: n = 1E6

	double precision :: t1, t2, pi 

	call cpu_time(t1)
	call Pi1(n, pi)
	call cpu_time(t2)

	write(*,*) "Generating random numbers once: "
	write(*,*) "n = ", n
	write(*,*) "pi = ", pi
	write(*,*) "time = ", t2 - t1

end program name


! =========================================
! 	Estimate Pi using Monte Carlo method
! 	More efficient version
! =========================================
subroutine Pi1(n, pi)
	implicit none
	integer, intent(in) :: n
	double precision, intent(out) :: pi

	integer :: i, pts_in, pts_out
	double precision :: x(n), y(n)

	pts_in = 0
	pts_out = 0

	call random_number(x)
	call random_number(y)

	do i = 1, n
		
		if (x(i)**2 + y(i)**2 <= 1) then
			pts_in = pts_in + 1
		else
			pts_out = pts_out + 1
		end if
	end do
	
	pi = 4.0 * pts_in / n

end subroutine Pi1


! =========================================
! 	Estimate Pi using Monte Carlo method
! 	Less efficient version
! =========================================
subroutine pi2(n, pi)
	integer, intent(in) :: n
	double precision, intent(out) :: pi

	integer :: i, pts_in, pts_out
	double precision :: x, y

	pts_in = 0
	pts_out = 0

	do i = 1, n
		call random_number(x)
		call random_number(y)

		if (x**2 + y**2 <= 1) then
			pts_in = pts_in + 1
		else
			pts_out = pts_out + 1
		end if
	end do 
	
	pi = 4.0 * pts_in / n

end subroutine pi2