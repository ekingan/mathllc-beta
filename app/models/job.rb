class Job < ApplicationRecord
  belongs_to :client

  enum job_type: [:Individual_1040, :S_Corp_1120S, :Partnership_1065, :C_Corp_1120, :Non_Profit_990, :Trust_1041, :Estate_706, :Amendment, :bookkeeping, :consulting, :referral, :teaching, :other]
  enum status: [:todo, :in_progress, :need_info, :need_signatures, :ready, :filed, :done, :extended, :accepted, :rejected, :review]
end
