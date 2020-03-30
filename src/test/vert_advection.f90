module advection_mod
contains
    subroutine compute_advection(w_full, initC, sfc_C, nt, nz, &
                                   z_full, diff_method, C)
    ! Vertical advection = w * (dC/dz)
    ! diff_method: 1. Foward/Centerd finite difference
    !              2. Finite volume method
    implicit none
    integer, intent(in)    :: nt
    character(len=*), intent(in) :: diff_method
    integer :: n, k, nz, dt = 20
    real    :: dC_dz, zbottom = 0.
    real    :: sfc_C    ! for surface effect (radiation, etc ...)
    real, dimension(nz)    :: w_full, initC, z_full
    real, dimension(nz+1)  :: w_half
    real, dimension(nt,nz) :: C

    ! Initial value
    C(1,:) = initC

    ! Make stagged grid for advection
    w_half(2:nz) = ( w_full(2:) + w_full(1:nz-1) ) / 2.

    ! homogeneous Dirichlet Boundary Condition
    w_half(1) = 0.; w_half(nz+1) = 0.  ! Top/Bottom w=0  [m s-1]

    select case (diff_method)
        ! Here, we use Lorenz configuration
        ! See Figure 1 in Holdaway et al., (2012) 
        ! https://rmets.onlinelibrary.wiley.com/doi/epdf/10.1002/qj.2016
        case ("finite_difference")
            !  C(n+1,k) - C(n,k)           C(n,k+1) - C(n,k-1)
            ! ------------------- = -w(k) ---------------------
            !          dt                  z(n,k+1) - z(n,k-1)
            do n = 1, nt-1
                do k = 2, nz-1
                    dC_dz = ( C(n,k+1) - C(n,k-1) ) / &
                            ( z_full(k+1) - z_full(k-1) )
                    C(n+1,k) = C(n,k) - w_full(k)*dt*dC_dz
                end do

                ! Foward/Backward difference at boundary
                C(n+1, 1) = C(n,1) - w_half(2)*dt* &
                          ( C(n,2) - C(n,1) ) /  &
                          ( z_full(2) - z_full(1) )
                C(n+1,nz) = C(n,nz) - w_half(nz)*dt* &
                          ( C(n,nz) - C(n,nz-1) ) /  &
                          ( z_full(nz) - z_full(nz-1) )
            end do
        case ("finite_volume")
            print*, "TODO! need to work..."
            stop
            ! flux_minus = C(j-1)*w(j-0.5)*dt
            ! flux_plus  = C(j  )*w(j+0.5)*dt
            ! C(j,n+1)   = C(j,n)+(flux_minus-flux_plus)
        case default
            print*, "Not setup diff_method option. &
                     please check input.nml"
    end select

    end subroutine compute_advection
end module advection_mod
