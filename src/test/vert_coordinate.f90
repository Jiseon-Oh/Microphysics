module vert_coordinate_mod
contains
    subroutine compute_vert_coord(ztop, zbottom, nz, grid_dz, z_full, z_half)
    implicit none
    integer, intent(in) :: nz                ! Num of z_full
    real,    intent(in) :: ztop, zbottom     ! [km]
    character(len=*), intent(in)       :: grid_dz
    real, intent(out), dimension(nz)   :: z_full
    real, intent(out), dimension(nz+1) :: z_half
    integer :: k
    real, parameter :: dzr = 0.9
    real, dimension(nz) :: dz   ! delta z for z_half

    select case (grid_dz)
        case ("constant_grid")
            dz = (ztop - zbottom) * 1000. / nz
            z_half(1) = zbottom * 1000.
            do k = 1, nz
                z_half(k+1) = z_half(k) + dz(k)
            end do
            z_full = z_half(1:nz) + dz/2.
        case ("stretching_grid")
            dz(1) = (ztop*1000*(dzr-1))/(dzr**nz-1)
!               print*, dz(1)
             do k = 2, nz
                 dz(k) = dz(1)*(dzr**(k-1))
!                 print*, dz(k)
             end do

            z_half(1) = zbottom * 1000.
             do k = 1, nz
                z_half(k+1) = z_half(k) + dz(k)
                z_full(k) = z_half(k)+dz(k)/2.
                print*, dz(k), z_half(k+1)
             end do
             


             ! calc_ztop = dz(1)*(dzr-1)/(dzr-1)
        case default
!            print*, "Not setup grid_dz option. &
!                     please check input.nml"
!            stop
    end select

    end subroutine compute_vert_coord
end module vert_coordinate_mod
