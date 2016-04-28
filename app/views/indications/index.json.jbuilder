json.array!(@indications) do |indication|
  json.extract! indication, :id, :underwriter_id, :state, :effective_date, :expire_date, :wholesale_agency_id, :retail_agency_id, :placement_fee, :employee_payroll, :owner_payroll, :total_payroll, :sub_out_commercial, :sub_out_residential, :gross_receipts_current, :description_of_operations, :type_of_contractor, :type_al_requested, :limits_selected, :insured_ops, :limits, :rating_factor, :dba, :name, :zip, :address1, :address2, :city, :email, :fax, :phone, :state_code, :gf_comments, :approval_comments, :pdf_natural_url, :pdf_tracking_url, :mgu_id
  json.url indication_url(indication, format: :json)
end
